import 'package:ctonlinereport/report/domain/entity/report_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture.dart';
import '../../test_helper.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  test('the equality of report posts', () {
    const post = ReportPost(
      time: '12:00',
      classes: ['a'],
      textContent: 'Hello',
      htmlContent: '<b>Hello</b>',
      content: [
        TextSpan(text: 'Hello', style: TextStyle(fontWeight: FontWeight.bold))
      ],
    );

    expect(
      post,
      ReportPost(
        time: '12:00',
        classes: const ['a'],
        textContent: 'Hello',
        htmlContent: '<b>Hello</b>',
        content: const [
          TextSpan(text: 'Hello', style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );

    expect(
      post,
      isNot(ReportPost(
        time: '01:00',
        classes: const ['b'],
        textContent: 'Hello',
        htmlContent: 'Hello',
        content: const [TextSpan(text: 'Hello')],
      )),
    );
  });

  test('should parse report post - plain text content', () {
    final result = fileFixture('result.html');
    final postElement = TestHelper.parsePostsElements(result).first;

    expect(
      TestHelper.parseReportPost(postElement),
      ReportPost.fromHTML(postElement),
    );
  });

  test('should parse report post - text with spaces and newlines', () {
    final result = fileFixture('result_with_spaces.html');
    final postElement = TestHelper.parsePostsElements(result).first;

    expect(
      TestHelper.parseReportPost(postElement),
      ReportPost.fromHTML(postElement),
    );
  });

  test('should parse report post - text with useless spans', () {
    final result = fileFixture('result_with_spans.html');
    final postElement = TestHelper.parsePostsElements(result).first;

    expect(
      TestHelper.parseReportPost(postElement),
      ReportPost.fromHTML(postElement),
    );
  });

  test('should parse report post - text with useless spans (nested)', () {
    final result = fileFixture('result_with_nested_spans.html');
    final postElement = TestHelper.parsePostsElements(result).first;

    expect(
      TestHelper.parseReportPost(postElement),
      ReportPost.fromHTML(postElement),
    );
  });
}
