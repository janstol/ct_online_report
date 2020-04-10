import 'package:ctonlinereport/core/constants.dart';
import 'package:ctonlinereport/core/util/extensions/html_ext.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class ReportPost extends Equatable {
  /// Time when post was published (HH:MM format).
  final String time;

  /// Raw (HTML) content.
  final String htmlContent;

  /// Content in plain text.
  final String textContent;

  /// Formatted text for [RichText].
  final List<InlineSpan> content;

  /// CSS classes at post
  final List<String> classes;

  const ReportPost({
    @required this.time,
    @required this.textContent,
    @required this.htmlContent,
    @required this.content,
    @required this.classes,
  });

  // ignore: prefer_constructors_over_static_methods
  static ReportPost fromHTML(dom.Element element) {
    final htmlContent = element.nextElementSibling.innerHtml
        .trim()
        .replaceAll('\n', ' ')
        .replaceAll('  ', '');

    return ReportPost(
      time: element.querySelector('p').text,
      classes: element.classes.toList()..removeWhere(classesToRemove.contains),
      textContent: element.nextElementSibling.querySelector('p').text,
      htmlContent: htmlContent,
      content: parser.parseFragment(htmlContent).toTextSpans(),
    );
  }

  @override
  List<Object> get props => [time, classes, textContent];

  @override
  String toString() =>
      'ReportPost[time: $time, classes: $classes, textContent: $textContent]';
}
