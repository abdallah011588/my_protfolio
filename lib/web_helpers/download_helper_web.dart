import 'dart:html' as html;

void downloadFile({
  required String url,
  required String fileName,
}) {
  final anchor = html.AnchorElement(href: url)
    ..download = fileName
    ..target = '_blank'
    ..style.position = 'fixed'
    ..style.left = '-9999px'
    ..style.top = '-9999px';

  html.document.body?.children.add(anchor);
  anchor.click();
  anchor.remove();
}
