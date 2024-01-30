import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SGR extends StatefulWidget {
  const SGR({super.key});

  @override
  SGRState createState() => SGRState();
}

class SGRState extends State<SGR> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      WebView(
        initialUrl: 'https://sgr.ufms.br/sgr/',
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
