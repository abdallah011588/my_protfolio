import 'package:url_launcher/url_launcher.dart';

void openExternalUrl(String url) {
  final uri = Uri.parse(url);
  launchUrl(uri, mode: LaunchMode.externalApplication);
}
