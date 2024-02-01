import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SGR extends StatefulWidget {
  const SGR({super.key});

  @override
  SGRState createState() => SGRState();
}

class SGRState extends State<SGR> {
  bool isLoading = true;
  bool loggedIn = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      WebView(
        initialUrl: 'https://sgr.ufms.br/sgr/',
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (finish) {
          if (loggedIn == false) {
            setState(() {
              isLoading = false;
              loggedIn = true;
              _controller.future.then((value) => value.evaluateJavascript('''
                             var login = document.getElementById("username");
                             var password = document.getElementByName("j_password");
                             login.value = "enzo.terra";
                             password.value = "";
                           '''));
            });
          }
        },
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
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
