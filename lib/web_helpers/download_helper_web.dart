import 'dart:html' as html;

void downloadFile({
  required String url,
  required String fileName,
}) {
  final anchor = html.AnchorElement(href: url)
    ..download = fileName
    ..style.display = 'none';

  html.document.body?.children.add(anchor);
  anchor.click();
  anchor.remove();
}
