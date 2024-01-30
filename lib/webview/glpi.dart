import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GLPI extends StatefulWidget {
  const GLPI({super.key});

  @override
  GLPIState createState() => GLPIState();
}

class GLPIState extends State<GLPI> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      WebView(
        initialUrl: 'https://suporte.ufms.br/front/ticket.php',
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (finish) {
          setState(() {
            isLoading = false;
          });
        },
      ),
      isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const Stack(),
    ]);
  }
}
