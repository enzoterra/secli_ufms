import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GLPI extends StatelessWidget {
  const GLPI({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://suporte.ufms.br/front/ticket.php', 
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

/*import 'package:webview_flutter/webview_flutter.dart';

WebViewController controllerGlpi = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://flutter.dev'));*/
