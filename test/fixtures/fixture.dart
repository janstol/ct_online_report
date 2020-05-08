import 'dart:io';

import 'package:ct_online_report/report/domain/entity/report.dart';
import 'package:ct_online_report/report/domain/entity/report_post.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

String fileFixture(String name) =>
    File('$_testDirectory/fixtures/$name').readAsStringSync();

// From https://github.com/flutter/flutter/issues/20907#issuecomment-466185328
final _testDirectory = join(
  Directory.current.path,
  Directory.current.path.endsWith('test') ? '' : 'test',
);

const ReportPost reportPost = ReportPost(
    time: '10:00',
    classes: ['cesko'],
    textContent: 'Hello',
    htmlContent: '<b>Hello</b>',
    content: [
      TextSpan(text: 'Hello', style: TextStyle(fontWeight: FontWeight.bold))
    ]);

Report generateReport(int posts) {
  return Report(
    page: 1,
    pages: 100,
    posts: List.generate(posts, (_) => reportPost),
    timestamp: DateTime(2020),
  );
}
