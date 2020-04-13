import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture.dart';
import '../../test_helper.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  test('the equality of empty reports', () {
    expect(Report.empty(), Report.empty());
  });

  test('the equality of reports', () {
    expect(
      Report(page: 1, pages: 10, posts: [reportPost], timestamp: null),
      Report(page: 1, pages: 10, posts: [reportPost], timestamp: null),
    );

    expect(
      Report(page: 2, pages: 10, posts: [reportPost], timestamp: null),
      isNot(Report(page: 1, pages: 10, posts: [reportPost], timestamp: null)),
    );

    expect(
      Report(page: 1, pages: 10, posts: const [], timestamp: DateTime.now()),
      isNot(Report(page: 1, pages: 10, posts: [reportPost], timestamp: null)),
    );
  });

  test('should parse report general - plain text content', () {
    final result = fileFixture('result.html');

    expect(
      TestHelper.parseReport(result),
      Report.fromHTML(result).copyWith(timestamp: DateTime(2020)),
    );
  });

  test('should parse report - text with newlines', () {
    final result = fileFixture('result_with_spaces.html');

    expect(
      TestHelper.parseReport(result),
      Report.fromHTML(result).copyWith(timestamp: DateTime(2020)),
    );
  });

  test('should parse report - text with useless spans', () {
    final result = fileFixture('result_with_spans.html');

    expect(
      TestHelper.parseReport(result),
      Report.fromHTML(result).copyWith(timestamp: DateTime(2020)),
    );
  });

  test('should parse report with img', () {
    final result = fileFixture('result_with_img.html');

    expect(
      TestHelper.parseReport(result),
      Report.fromHTML(result).copyWith(timestamp: DateTime(2020)),
    );
  });

  test('should parse report with link', () {
    final result = fileFixture('result_with_img.html');

    expect(
      TestHelper.parseReport(result),
      Report.fromHTML(result).copyWith(timestamp: DateTime(2020)),
    );
  });
}
