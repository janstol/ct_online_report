import 'package:ct_online_report/core/constants.dart';
import 'package:ct_online_report/core/domain/api_exception.dart';
import 'package:ct_online_report/core/infrastructure/api.dart';
import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/report/domain/entity/report.dart';
import 'package:ct_online_report/settings/application/settings_bloc.dart';
import 'package:ct_online_report/settings/application/settings_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture.dart';
import '../../mocks/mock_http_client.dart';
import '../../mocks/mock_settings_bloc.dart';

void main() {
  ReportApi api;
  SettingsBloc settingsBloc;

  setUp(() {
    settingsBloc = MockSettingsBloc();
    when(settingsBloc.state).thenReturn(
      SettingsState(defaultReportUrl, defaultReportId),
    );
    api = ReportApi(client: mockClient, settingsBloc: settingsBloc);
  });

  test('should return full report with multiple posts', () async {
    expect(
      (await api.fetchReport(resultFullPage))
          .copyWith(timestamp: DateTime(2020)),
      Report.fromHTML(fileFixture('result.html'))
          .copyWith(timestamp: DateTime(2020)),
    );
  });

  test('should return full report with img post', () async {
    expect(
      (await api.fetchReport(resultImgPage))
          .copyWith(timestamp: DateTime(2020)),
      Report.fromHTML(fileFixture('result_with_img.html'))
          .copyWith(timestamp: DateTime(2020)),
    );
  });

  test('should return full report with link post', () async {
    expect(
      (await api.fetchReport(resultLinkPage))
          .copyWith(timestamp: DateTime(2020)),
      Report.fromHTML(fileFixture('result_with_link.html'))
          .copyWith(timestamp: DateTime(2020)),
    );
  });

  test('should return full report with spaces in text', () async {
    expect(
      (await api.fetchReport(resultSpacesPage))
          .copyWith(timestamp: DateTime(2020)),
      Report.fromHTML(fileFixture('result_with_spaces.html'))
          .copyWith(timestamp: DateTime(2020)),
    );
  });

  test('should return full report with spans in text', () async {
    expect(
      (await api.fetchReport(resultSpansPage))
          .copyWith(timestamp: DateTime(2020)),
      Report.fromHTML(fileFixture('result_with_spans.html'))
          .copyWith(timestamp: DateTime(2020)),
    );
  });

  test('should return full report with nested spans in text', () async {
    expect(
      (await api.fetchReport(resultNestedSpansPage))
          .copyWith(timestamp: DateTime(2020)),
      Report.fromHTML(fileFixture('result_with_nested_spans.html'))
          .copyWith(timestamp: DateTime(2020)),
    );
  });

  test('should throw ApiException - fetch failed', () async {
    expect(
      api.fetchReport(resultFetchFailedPage),
      throwsA(predicate<ApiException>(
        (e) =>
            e.statusCode == null &&
            e.message == strings.exception.api.fetchFailed,
      )),
    );
  });

  test('should throw ApiException - error', () async {
    expect(
      api.fetchReport(resultNetworkExceptionPage),
      throwsA(predicate<ApiException>(
        (e) =>
            e.statusCode == null && e.message == strings.exception.api.general,
      )),
    );
  });

  test('should throw ApiException - HTTP error', () async {
    expect(
      api.fetchReport(resultHttpErrorPage),
      throwsA(predicate<ApiException>(
        (e) =>
            e.statusCode == 404 &&
            e.message == strings.exception.api.withCode(404),
      )),
    );
  });
}
