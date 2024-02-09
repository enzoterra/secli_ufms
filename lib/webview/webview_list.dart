import 'package:flutter/material.dart';
import 'package:Secli/components/topbar.dart';
import 'package:Secli/drawer.dart';
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
  //late String title, url;
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
                _controller.future.then((value) =>
                    value.evaluateJavascript('''                             
                             var login = document.getElementById("${nomeSenha[0]}");
                             var password = document.getElementById("${nomeSenha[1]}");
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
      ]),
      drawer: const NavDrawer(),
    );
  }

  List<String> setarIds(String nomeUrl) {
    /*ORDEM LISTA
    'https://suporte.ufms.br/front/ticket.php',
    'http://atendimento.ufms.br/tickets',
    'https://passaporte.ufms.br/#/admin/contas',
    'https://siscad.ufms.br/administrativo/academicos',
    'https://sgr.ufms.br/sgr/',
    'https://www.google.com/maps/d/viewer?mid=1eShRhZJD22ongitLPOZ12zHU0Sd_vGE&ll=-20.503439514484356%2C-54.61543129999999&z=16',
    'https://monitoramento-redes.ufms.br/zabbix.php?action=map.view&sysmapid=62',
    'https://patrimonio.ufms.br/',
    'https://rmo.ufms.br/pages/home',
    'https://intranet.ufms.br/pages/home',
    'https://sistemas.ufms.br/'
    */
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
    } else if (nomeUrl == "Siscad" || nomeUrl == "SGR" || nomeUrl == "RMO" || nomeUrl == "Intranet") {
      login = "username";
      senha = "password";
    } else if (nomeUrl == "Situação Redes") {
      login = "name";
      senha = "password";
    }
    List<String> loginSenha = [login, senha];
    return loginSenha;
  }
}
