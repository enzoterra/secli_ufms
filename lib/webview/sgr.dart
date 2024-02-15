import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
              _controller.future.then((value) async {
                var prefs = await SharedPreferences.getInstance();
                String name = "";
                String password = "";

                if (prefs.containsKey('email')) {
                  name = prefs.getString('email')!;
                }
                if (prefs.containsKey('password')) {
                  password = prefs.getString('password')!;
                }
                Timer(const Duration(milliseconds: 1500), () {
                  value.evaluateJavascript('''
                             var login = document.getElementById("username");
                             var password = document.getElementsByName("j_password");
                             login.value = "$name";
                             password.value = "$password";
                           ''');
                });
              });
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
