import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Passaporte extends StatefulWidget {
  const Passaporte({super.key});

  @override
  PassaporteState createState() => PassaporteState();
}

class PassaporteState extends State<Passaporte> {
  bool isLoading = true;
  bool loggedIn = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      WebView(
        initialUrl: 'https://passaporte.ufms.br/#/admin/contas',
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (finish) {
          if (loggedIn == false) {
            setState(() {
              isLoading = false;
              loggedIn = true;
              _controller.future.then((value) => value.evaluateJavascript('''
                             var login = document.getElementById("passaporte");
                             var password = document.getElementById("senha");
                             login.value = "enzo.terra";
                             password.value = "Engipa2304@";
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
