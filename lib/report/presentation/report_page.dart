import 'dart:async';

import 'package:ctonlinereport/core/keys.dart';
import 'package:ctonlinereport/core/presentation/widget/error_mesage_widget.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/report/application/report_bloc.dart';
import 'package:ctonlinereport/report/application/report_event.dart';
import 'package:ctonlinereport/report/application/report_state.dart';
import 'package:ctonlinereport/report/presentation/widget/paginator/paginator.dart';
import 'package:ctonlinereport/report/presentation/widget/report_post_item.dart';
import 'package:ctonlinereport/settings/presentation/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReportPage extends StatefulWidget {
  static const routeName = '/';

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  ScrollController _scrollController;
  Completer<void> _refreshCompleter;
  bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (_isVisible) {
            setState(() => _isVisible = false);
          }
        }
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!_isVisible) {
            setState(() => _isVisible = true);
          }
        }
      },
    );
    _refreshCompleter = Completer<void>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ReportBloc>(context).add(const ReportFetchEvent(1));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.app.name),
        actions: <Widget>[
          IconButton(
            key: Keys.settingsButton,
            tooltip: strings.app.settings.title,
            icon: Icon(MdiIcons.cog),
            onPressed: () =>
                Navigator.pushNamed(context, SettingsPage.routeName),
          )
        ],
      ),
      body: BlocConsumer<ReportBloc, ReportState>(
        listener: (context, state) {
          if (state is ReportSuccessState || state is ReportErrorState) {
            _refreshCompleter?.complete();
            _refreshCompleter = Completer<void>();
          }
        },
        builder: (context, state) {
          if (state is ReportErrorState) {
            return Center(
              child: ErrorMessageWidget(failure: state.failure),
            );
          }

          if (state is ReportSuccessState) {
            final report = state.report;
            return RefreshIndicator(
              onRefresh: () {
                BlocProvider.of<ReportBloc>(context)
                    .add(ReportFetchEvent(report.page, refresh: true));
                return _refreshCompleter.future;
              },
              child: ListView.builder(
                key: Keys.reportPosts,
                itemCount: report.posts.length,
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ReportPostItem(post: report.posts[index]);
                },
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        crossFadeState:
            _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: BottomAppBar(
          color: Theme.of(context).primaryColor,
          child: const Paginator(),
        ),
        secondChild: const SizedBox(key: Key('__S__'), height: 0),
      ),
    );
  }
}
