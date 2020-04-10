import 'dart:io';

import 'package:ctonlinereport/core/domain/api_exception.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:ctonlinereport/settings/application/settings_bloc.dart';
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
      if (e.osError.errorCode == 7) {
        throw ApiException(strings.api.error.apiErrorFetchFailed);
      }
      throw ApiException(e.message);
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ApiException(strings.api.error.apiError);
    }

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      return response.body;
    } else {
      throw ApiException(
        strings.api.error.withCode(statusCode),
        statusCode,
      );
    }
  }
}
