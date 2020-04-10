import 'package:equatable/equatable.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();
}

class ReportFetchEvent extends ReportEvent {
  final int page;
  final bool refresh;

  const ReportFetchEvent(this.page, {this.refresh = false});

  @override
  List<Object> get props => [page];
}
