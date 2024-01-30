import 'package:Secli/components/bottomNavigation.dart';
import 'package:Secli/webview/webview_url.dart';
import 'package:flutter/material.dart';
import 'package:Secli/components/topbar.dart';
import 'package:Secli/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.urlIndex});

  final int urlIndex;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  //int currentIndex = 1;
  final List<String> paginas = [
    'https://sgr.ufms.br/sgr/',
    'https://suporte.ufms.br/front/ticket.php',
    'https://passaporte.ufms.br/#/admin/contas',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: TopBar()),
      body: WebviewUrl(url: paginas[widget.urlIndex]),
      bottomNavigationBar: CustomBottomNavigation(urlIndex: widget.urlIndex),
      drawer: const NavDrawer(),
    );
  }
}
