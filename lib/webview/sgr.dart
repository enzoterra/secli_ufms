import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SGR extends StatelessWidget {
  const SGR({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://sgr.ufms.br/sgr/', 
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
