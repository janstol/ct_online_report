import 'package:ctonlinereport/core/constants.dart';
import 'package:ctonlinereport/core/util/extensions/html_ext.dart';
import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:ctonlinereport/report/domain/entity/report_post.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class TestHelper {
  static List<dom.Element> parsePostsElements(String result) {
    return parser
        .parse(result)
        .getElementsByClassName('onlineReportContent onlineReportPosts')
        .first
        .getElementsByTagName('dt');
  }

  static ReportPost parseReportPost(dom.Element element) {
    final htmlContent = element
        .nextElementSibling
//        .querySelector('p')
        .innerHtml
        .trim()
        .replaceAll('\n', ' ')
        .replaceAll('  ', '');

    final content = parser
        .parseFragment(htmlContent)
        .nodes
        .map((n) => n.toTextSpan())
        .toList();

    final classes = element.classes.toList()
      ..removeWhere(classesToRemove.contains);

    return ReportPost(
      time: element.querySelector('p').text,
      textContent: element.nextElementSibling.querySelector('p').text,
      htmlContent: htmlContent,
      content: content,
      classes: classes,
    );
  }

  static Report parseReport(String result) {
    final parsedResponse = parser.parse(result);

    final page = int.parse(
      parsedResponse
          .querySelectorAll('#paginator > span:not(.last):not(.next)')
          .last
          .text,
    );

    final pages = int.parse(parsedResponse
        .getElementById('paginator')
        .querySelector('.last')
        .previousElementSibling
        .previousElementSibling
        .text);

    final posts = <ReportPost>[];
    for (final post in parsePostsElements(result)) {
      posts.add(parseReportPost(post));
    }

    return Report(
      page: page,
      pages: pages,
      posts: posts,
      timestamp: DateTime(2020),
    );
  }
}
