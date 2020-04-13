import 'dart:io';

import 'package:ctonlinereport/core/res.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import '../fixtures/fixture.dart';

const resultFullPage = 1;
const resultImgPage = 2;
const resultLinkPage = 3;
const resultNestedSpansPage = 4;
const resultSpacesPage = 5;
const resultSpansPage = 6;
const resultFetchFailedPage = 7;
const resultNetworkExceptionPage = 8;
const resultHttpErrorPage = 9;

final MockClient mockClient = MockClient((request) async {
  final page = int.parse(request.bodyFields['page']);

  String responseBody;
  int responseCode;

  switch (page) {
    case resultFullPage:
      responseCode = 200;
      responseBody = fileFixture('result.html');
      break;
    case resultImgPage:
      responseCode = 200;
      responseBody = fileFixture('result_with_img.html');
      break;
    case resultLinkPage:
      responseCode = 200;
      responseBody = fileFixture('result_with_link.html');
      break;
    case resultNestedSpansPage:
      responseCode = 200;
      responseBody = fileFixture('result_with_nested_spans.html');
      break;
    case resultSpacesPage:
      responseCode = 200;
      responseBody = fileFixture('result_with_spaces.html');
      break;
    case resultSpansPage:
      responseCode = 200;
      responseBody = fileFixture('result_with_spans.html');
      break;
    case resultFetchFailedPage:
      throw const SocketException('', osError: OSError('7', 7));
    case resultNetworkExceptionPage:
      throw SocketException(
        strings.exception.api.general,
        osError: const OSError('1', 1),
      );
    case resultHttpErrorPage:
      responseCode = 404;
      responseBody = '<h1>404 Not found</h1>';
      break;
    default:
      throw Exception(strings.exception.api.general);
  }

  return Response(
    responseBody,
    responseCode,
    headers: {HttpHeaders.contentTypeHeader: 'text/html; charset=UTF-8'},
  );
});
