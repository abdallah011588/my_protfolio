import 'dart:html' as html;

void openExternalUrl(String url) {
  final scheme = Uri.tryParse(url)?.scheme.toLowerCase();
  final anchor = html.AnchorElement(href: url)
    ..style.position = 'fixed'
    ..style.left = '-9999px'
    ..style.top = '-9999px';

  if (scheme != 'mailto' && scheme != 'tel') {
    anchor
      ..target = '_blank'
      ..rel = 'noopener noreferrer';
  }

  html.document.body?.children.add(anchor);
  anchor.click();
  anchor.remove();
}
