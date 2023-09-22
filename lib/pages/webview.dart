import 'package:flutter/material.dart';
import 'package:Secli/topbar.dart';
import 'package:Secli/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewController extends StatelessWidget {
  WebviewController({super.key, required this.index});
  final int index;
  final List<String> urls = [
    'https://suporte.ufms.br/front/ticket.php',
    'http://atendimento.ufms.br/tickets',
    'https://passaporte.ufms.br/#/admin/contas',
    'https://siscad.ufms.br/administrativo/academicos',
    'https://sgr.ufms.br/sgr/',
    'https://www.google.com/maps/d/viewer?mid=1eShRhZJD22ongitLPOZ12zHU0Sd_vGE&ll=-20.503439514484356%2C-54.61543129999999&z=16',
    'https://monitoramento-redes.ufms.br/zabbix.php?action=map.view&sysmapid=62',
    'https://patrimonio.ufms.br/',
    'http://inventario-disc/relatorios/report/Relatório%20de%20Computadores/Gest%C3%A3o%20de%20Ativos%20de%20TIC%20UFMS',
    'https://rmo.ufms.br/pages/home',
    'https://intranet.ufms.br/pages/home',
    'https://sistemas.ufms.br/'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: TopBar()),
      body: WebView(
        initialUrl: urls[index],
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: const NavDrawer(),
    );
  }
}
