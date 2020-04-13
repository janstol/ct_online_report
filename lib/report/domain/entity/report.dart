import 'package:ctonlinereport/report/domain/entity/report_post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';

@immutable
class Report extends Equatable {
  final int page;
  final int pages;
  final List<ReportPost> posts;
  final DateTime timestamp;

  const Report({
    @required this.page,
    @required this.pages,
    @required this.posts,
    @required this.timestamp,
  });

  const Report.empty()
      : page = 1,
        pages = 1,
        posts = const [],
        timestamp = null;

  /// Creates [Report] from HTML.
  factory Report.fromHTML(String responseBody) {
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

    return Report(
      page: page,
      pages: pages,
      posts: posts,
      timestamp: DateTime.now(),
    );
  }

  Report copyWith({
    int page,
    int pages,
    List<ReportPost> posts,
    DateTime timestamp,
  }) {
    return Report(
      page: page ?? this.page,
      pages: pages ?? this.pages,
      posts: posts ?? this.posts,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  List<Object> get props => [page, pages, posts, timestamp];

  @override
  // TODO: implement stringify
  bool get stringify => true;

//  @override
//  String toString() =>
//      'Report(page; $page, pages: $pages, posts: ${posts.length})';
}
