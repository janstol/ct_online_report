import 'package:ct_online_report/core/util/link_text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

/// Extensions for [DocumentFragment].
extension HtmlDocumentFragmentExt on DocumentFragment {
  List<InlineSpan> toTextSpans() {
    return nodes.map((node) => node.toTextSpan()).toList();
  }
}

/// Extensions for HTML [Node].
extension HtmlNodeExt on Node {
  /// Returns HTML tag name (strong, img, a,...)
  String get htmlTag {
    return parentNode.children
            .firstWhere((child) => child.text == text, orElse: () => null)
            ?.localName ??
        '';
  }

  String get innerHtml {
    return parentNode.children
            .firstWhere((child) => child.text == text, orElse: () => null)
            ?.innerHtml ??
        '';
  }

  // ignore: missing_return
  TextSpan toTextSpan() {
    if (htmlTag == 'img') {
      return LinkTextSpan(
        text: "Obr.: ${attributes['alt']}",
        url: attributes['src'],
        style: const TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (htmlTag == 'a') {
      return LinkTextSpan(
        text: text,
        url: attributes['href'],
        style: const TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (htmlTag == 'span' || htmlTag == 'p') {
      return TextSpan(
        children:
            parseFragment(innerHtml).nodes.map((n) => n.toTextSpan()).toList(),
      );
    } else {
      return TextSpan(text: text, style: _setTextStyle(htmlTag));
    }
  }

  static TextStyle _setTextStyle(String htmlTag) {
    switch (htmlTag) {
      case 'strong':
        return const TextStyle(fontWeight: FontWeight.bold);
      default:
        return const TextStyle();
    }
  }
}
