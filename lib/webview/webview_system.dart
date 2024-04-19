import 'package:Secli/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebviewSystem extends StatefulWidget {
  const WebviewSystem({super.key, required this.url, required this.nomeUrl});

  final String url;
  final String nomeUrl;

  @override
  WebviewSystemState createState() => WebviewSystemState();
}

class WebviewSystemState extends State<WebviewSystem> {
  bool isLoading = true;
  bool loggedIn = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  double webProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 5,
        child: LinearProgressIndicator(
          value: webProgress,
          color: CustomColors().darkBlueMain,
          backgroundColor: CustomColors().whiteBottomNavigation,
        ),
      ),
      Expanded(
          child: Stack(children: <Widget>[
        WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          onProgress: (progress) => setState(() {
            webProgress = progress / 100;
          }),
          onPageFinished: (finish) {
            if (loggedIn == false) {
              setState(() {
                isLoading = false;
                loggedIn = true;
                List<String> nomeSenha = setarIds(widget.nomeUrl);
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
                    if (nomeSenha[1] == "j_password") {
                      value.evaluateJavascript('''                             
                             var login = document.getElementById("${nomeSenha[0]}");
                             var password = document.getElementsByName("${nomeSenha[1]}");
                             login.value = "$name";
                             password.value = "$password";
                           ''');
                    } else {
                      value.evaluateJavascript('''                             
                             var login = document.getElementById("${nomeSenha[0]}");
                             var password = document.getElementById("${nomeSenha[1]}");
                             login.value = "$name";
                             password.value = "$password";
                           ''');
                    }
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
      ]))
    ]);
  }

  List<String> setarIds(String nomeUrl) {
    String login = "";
    String senha = "";
    if (nomeUrl == "GLPI") {
      login = "login_name";
      senha = "login_password";
    } else if (nomeUrl == "Whaticket") {
      login = "email";
      senha = "password";
    } else if (nomeUrl == "Passaporte") {
      login = "inputEmail";
      senha = "inputPassword";
    } else if (nomeUrl == "Siscad" ||
        nomeUrl == "RMO" ||
        nomeUrl == "Intranet") {
      login = "username";
      senha = "password";
    } else if (nomeUrl == "SGR") {
      login = "username";
      senha = "j_password";
    } else if (nomeUrl == "Situação Redes") {
      login = "name";
      senha = "password";
    }
    List<String> loginSenha = [login, senha];
    return loginSenha;
  }
}
