import 'package:flutter/material.dart';
import 'package:Secli/components/topbar.dart';
import 'package:Secli/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebviewList extends StatefulWidget {
  const WebviewList({super.key, required this.index});

  final int index;

  @override
  WebviewListState createState() => WebviewListState();
}

class WebviewListState extends State<WebviewList> {
  //late String title, url;
  bool isLoading = true;
  bool loggedIn = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final List<String> urls = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: TopBar()),
      body: Stack(children: <Widget>[
        WebView(
          initialUrl: urls[widget.index],
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            if (loggedIn == false) {
              setState(() {
                isLoading = false;
                loggedIn = true;
                List<String> nomeSenha = setarIds(widget.index);
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

  List<String> setarIds(int index) {
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
    List<String> loginSenha = [];
    String login = "";
    String senha = "";
    if (index == 0) {
      login = "login_name";
      senha = "login_password";
    } else if (index == 1) {
      login = "email";
      senha = "password";
    } else if (index == 2) {
      login = "inputEmail";
      senha = "inputPassword";
    } else if (index == 3 || index == 4 || index == 8 || index == 9) {
      login = "username";
      senha = "password";
    } else if (index == 6) {
      login = "name";
      senha = "password";
    }

    loginSenha[0] = login;
    loginSenha[1] = senha;
    return loginSenha;
  }
}
