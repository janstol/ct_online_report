import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fixture.dart';
import '../test_helper.dart';

void main() {
  test('should parse report general - plain text content', () {
    final result = fixture('result.html');

    expect(TestHelper.parseReport(result), Report.fromHTML(result));
  });

  test('should parse report - text with newlines', () {
    final result = fixture('result_with_spaces.html');

    expect(TestHelper.parseReport(result), Report.fromHTML(result));
  });

  test('should parse report - text with useless spans', () {
    final result = fixture('result_with_spans.html');

    expect(TestHelper.parseReport(result), Report.fromHTML(result));
  });

  test('should parse report with img', () {
    final result = fixture('result_with_img.html');

    expect(TestHelper.parseReport(result), Report.fromHTML(result));
  });

  test('should parse report with link', () {
    final result = fixture('result_with_img.html');

    expect(TestHelper.parseReport(result), Report.fromHTML(result));
  });
}
