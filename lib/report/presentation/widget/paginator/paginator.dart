import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/report/application/report_bloc.dart';
import 'package:ctonlinereport/report/application/report_event.dart';
import 'package:ctonlinereport/report/application/report_state.dart';
import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:ctonlinereport/report/presentation/widget/paginator/page_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Paginator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        final report =
            state is ReportSuccessState ? state.report : const Report.empty();
        final reportBloc = BlocProvider.of<ReportBloc>(context);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(MdiIcons.pageFirst, size: 28),
                color: IconTheme.of(context).color,
                onPressed: report.page == 1
                    ? null
                    : () => reportBloc.add(const ReportFetchEvent(1)),
                tooltip: strings.app.report.paginator.first,
              ),
              IconButton(
                icon: Icon(MdiIcons.chevronLeft, size: 28),
                color: IconTheme.of(context).color,
                onPressed: report.page == 1
                    ? null
                    : () => reportBloc.add(ReportFetchEvent(report.page - 1)),
                tooltip: strings.app.report.paginator.previous,
              ),
              OutlineButton(
                borderSide: BorderSide(color: IconTheme.of(context).color),
                disabledBorderColor: Colors.white24,
                onPressed: report.pages <= 0
                    ? null
                    : () => _showPagePicker(context, report),
                child: Text(
                  strings.app.report.paginator.page(report.page),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              IconButton(
                icon: Icon(MdiIcons.chevronRight, size: 28),
                color: IconTheme.of(context).color,
                onPressed: report.page == report.pages
                    ? null
                    : () {
                        reportBloc.add(ReportFetchEvent(report.page + 1));
                      },
                tooltip: strings.app.report.paginator.next,
              ),
              IconButton(
                icon: Icon(MdiIcons.pageLast, size: 28),
                color: IconTheme.of(context).color,
                onPressed: report.page == report.pages
                    ? null
                    : () => reportBloc.add(ReportFetchEvent(report.pages)),
                tooltip: strings.app.report.paginator.last,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showPagePicker(
    BuildContext context,
    Report report,
  ) async {
    final selectedPage = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: false,
      backgroundColor: Theme.of(context).primaryColorDark,
      builder: (_) => PagePicker(
        pageCount: report.pages,
        initialPage: report.page,
      ),
    );

    if (selectedPage != null) {
      BlocProvider.of<ReportBloc>(context).add(ReportFetchEvent(selectedPage));
    }
  }
}
