import 'package:flutter/material.dart';
import 'package:Secli/components/topbar.dart';
import 'package:Secli/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebviewList extends StatefulWidget {
  const WebviewList({super.key, required this.url, required this.nomeUrl});

  final String url;
  final String nomeUrl;

  @override
  WebviewListState createState() => WebviewListState();
}

class WebviewListState extends State<WebviewList> {
  bool isLoading = true;
  bool loggedIn = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: TopBar(
            isSettings: false,
          )),
      body: Stack(children: <Widget>[
        WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
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
      ]),
      drawer: const NavDrawer(),
    );
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
