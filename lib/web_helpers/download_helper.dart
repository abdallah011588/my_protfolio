import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

void downloadFile({
  required String url,
  required String fileName,
}) {
  _downloadFile(url: url, fileName: fileName);
}

Future<void> _downloadFile({
  required String url,
  required String fileName,
}) async {
  final uri = Uri.tryParse(url);
  if (uri != null && uri.hasScheme && (uri.isScheme('http') || uri.isScheme('https'))) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    return;
  }

  final assetPath =
      url.startsWith('assets/') ? url.replaceFirst('assets/', '') : url;
  final bytes = await rootBundle.load(assetPath);
  final directory = await getTemporaryDirectory();
  final file = File('${directory.path}${Platform.pathSeparator}$fileName');

  await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
  await OpenFilex.open(file.path);
}
