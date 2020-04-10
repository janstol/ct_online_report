import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:ctonlinereport/report/domain/entity/report_post.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fixture.dart';
import '../test_helper.dart';

void main() {
  test('should parse report post - plain text content', () {
    final result = fixture('result.html');
    final postElement = TestHelper.parsePostsElements(result).first;

    expect(
      TestHelper.parseReportPost(postElement),
      ReportPost.fromHTML(postElement),
    );
  });

  test('should parse report - text with spaces and newlines', () {
    final result = fixture('result_with_spaces.html');
    final postElement = TestHelper.parsePostsElements(result).first;

    expect(
      TestHelper.parseReportPost(postElement),
      ReportPost.fromHTML(postElement),
    );
  });

  test('should parse report - text with useless spans', () {
    final result = fixture('result_with_spans.html');
    final postElement = TestHelper.parsePostsElements(result).first;

    expect(
      TestHelper.parseReportPost(postElement),
      ReportPost.fromHTML(postElement),
    );
  });

  test('should parse report - text with useless spans (nested)', () {
    final result = fixture('result_with_nested_spans.html');
    final postElement = TestHelper.parsePostsElements(result).first;

    expect(
      TestHelper.parseReportPost(postElement),
      ReportPost.fromHTML(postElement),
    );
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
