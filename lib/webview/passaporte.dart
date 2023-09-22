import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Passaporte extends StatelessWidget {
  const Passaporte({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://passaporte.ufms.br/#/admin/contas', 
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
