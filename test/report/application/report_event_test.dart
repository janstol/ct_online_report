import 'package:ctonlinereport/report/application/report_event.dart';
import 'package:flutter_test/flutter_test.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  test('the equality of fetch events', () {
    const fetchEvent = ReportFetchEvent(1);
    expect(fetchEvent, ReportFetchEvent(1));
    expect(fetchEvent, ReportFetchEvent(1, refresh: false));
    expect(fetchEvent, isNot(ReportFetchEvent(1, refresh: true)));
    expect(fetchEvent, isNot(ReportFetchEvent(2)));
  });
}
