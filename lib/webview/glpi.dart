import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GLPI extends StatefulWidget {
  const GLPI({super.key});

  @override
  GLPIState createState() => GLPIState();
}

class GLPIState extends State<GLPI> {
  bool isLoading = true;
  bool loggedIn = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      WebView(
        initialUrl: 'https://suporte.ufms.br/front/ticket.php',
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (finish) {
          if (loggedIn == false) {
            setState(() {
              isLoading = false;
              loggedIn = true;
              _controller.future.then((value) => value.evaluateJavascript('''
                             var login = document.getElementById("login_name");
                             var password = document.getElementById("login_password");
                             login.value = "enzo.terra";
                             password.value = "";
                           '''));
            });
          }
          /*if (loggedIn == 1) {
            setState(() {
              _controller.future.then((value) => value.evaluateJavascript('''
                             document.getElementsByTagName('form').submit();
                           '''));
              loggedIn = 2;
            });
          }*/
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
