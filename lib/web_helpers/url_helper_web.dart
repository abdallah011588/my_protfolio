import 'dart:html' as html;

void openExternalUrl(String url) {
  final scheme = Uri.tryParse(url)?.scheme.toLowerCase();
  if (scheme == 'mailto' || scheme == 'tel') {
    html.window.location.href = url;
    return;
  }

  html.window.open(url, '_blank');
}
