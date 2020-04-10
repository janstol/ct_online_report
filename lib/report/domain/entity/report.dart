import 'package:ctonlinereport/report/domain/entity/report_post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';

@immutable
class Report extends Equatable {
  final int page;
  final int pages;
  final List<ReportPost> posts;

  const Report({
    @required this.page,
    @required this.pages,
    @required this.posts,
  });

  const Report.empty()
      : page = 1,
        pages = 1,
        posts = const [];

  // ignore: prefer_constructors_over_static_methods
  static Report fromHTML(String responseBody) {
    int page, pages;
    final List<ReportPost> posts = [];

    final parsedResponse = parse(responseBody);
    final reportPosts = parsedResponse
        .getElementsByClassName('onlineReportContent onlineReportPosts')
        .first;

    page = int.parse(
      parsedResponse
          .querySelectorAll('#paginator > span:not(.last):not(.next)')
          .last
          .text,
    );

    pages = int.parse(parsedResponse
        .getElementById('paginator')
        .querySelector('.last')
        .previousElementSibling
        .previousElementSibling
        .text);

    for (final header in reportPosts.getElementsByTagName('dt')) {
      posts.add(ReportPost.fromHTML(header));
    }

    return Report(page: page, pages: pages, posts: posts);
  }

  Report copyWith({int page, int pages, List<ReportPost> posts}) {
    return Report(
      page: page ?? this.page,
      pages: pages ?? this.pages,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object> get props => [page, pages, posts];

  @override
  String toString() =>
      'Report[page; $page, pages: $pages, posts: ${posts.length}]';
}
