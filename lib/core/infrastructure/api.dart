import 'dart:io';

import 'package:ct_online_report/core/constants.dart';
import 'package:ct_online_report/core/domain/api_exception.dart';
import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/report/domain/entity/report.dart';
import 'package:ct_online_report/settings/application/settings_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

/// Class for fetching data from ThingSpeak API.
class ReportApi {
  final Client _client;
  final SettingsBloc _settingsBloc;

  String reportUrl;
  String reportId;

  ReportApi({Client client, SettingsBloc settingsBloc})
      : _client = client,
        _settingsBloc = settingsBloc {
    reportUrl = defaultReportUrl;
    reportId = defaultReportId;

    _settingsBloc.listen((state) {
      reportUrl = state.reportUrl;
      reportId = state.reportId;
    });
  }

  /// Fetches report (single page)
  Future<Report> fetchReport(int page) async {
    final result = await _sendPostRequest(
      reportUrl,
      {'Content-Type': 'application/x-www-form-urlencoded'},
      {'onlineReportId': reportId, 'page': '$page'},
    );

    return Report.fromHTML(result);
  }

  /// Sends POST request to [requestUrl].
  ///
  /// Returns response body on success
  /// or throws [ApiException] if there was an error.
  Future<String> _sendPostRequest(
    String url,
    Map<String, String> headers,
    Map<String, String> body,
  ) async {
    Response response;
    try {
      response = await _client.post(url, headers: headers, body: body);
    } on SocketException catch (e) {
      debugPrint(e.toString());
      if (e.osError.errorCode == 7) {
        throw ApiException(strings.exception.api.fetchFailed);
      }
      throw ApiException(e.message);
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ApiException(strings.exception.api.general);
    }

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      return response.body;
    } else {
      throw ApiException(
        strings.exception.api.withCode(statusCode),
        statusCode,
      );
    }
  }
}
