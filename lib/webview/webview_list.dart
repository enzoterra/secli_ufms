import 'package:flutter/material.dart';
import 'package:Secli/components/topbar.dart';
import 'package:Secli/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewList extends StatefulWidget {
  const WebviewList({super.key, required this.index});

  final int index;

  @override
  WebviewListState createState() => WebviewListState();
}

class WebviewListState extends State<WebviewList> {
  //late String title, url;
  bool isLoading = true;
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
      ]),
      drawer: const NavDrawer(),
    );
  }
}