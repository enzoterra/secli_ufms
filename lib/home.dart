import 'package:Secli/webview/webview_url.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:Secli/components/topbar.dart';
import 'package:Secli/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentIndex = 1;
  final List<String> paginas = [
    'https://sgr.ufms.br/sgr/',
    'https://suporte.ufms.br/front/ticket.php',
    'https://passaporte.ufms.br/#/admin/contas',
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    if (deviceInfo.orientation == Orientation.portrait) {
      return Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(60), child: TopBar()),
          //const PreferredSize(preferredSize: Size.fromHeight(60), child: TopBar())
          body: WebviewUrl(url: paginas[currentIndex]),
          bottomNavigationBar: Container(
              color: const Color.fromARGB(255, 240, 240, 240),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 0.0),
                  child: GNav(
                      selectedIndex: currentIndex,
                      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                      rippleColor: const Color.fromARGB(61, 41, 41, 41),
                      color: const Color.fromARGB(255, 51, 51, 51),
                      activeColor: Colors.white,
                      tabBackgroundColor:
                          const Color.fromARGB(255, 60, 118, 226),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 13),
                      tabBorderRadius: 5,
                      gap: 10,
                      textSize: 12,
                      tabs: const [
                        GButton(
                          icon: Icons.devices,
                          text: "SGR",
                        ),
                        GButton(
                          icon: Icons.support_agent,
                          text: "GLPI",
                        ),
                        GButton(
                          icon: Icons.manage_accounts,
                          text: "Passaporte",
                        ),
                      ],
                      onTabChange: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      }))),
                      drawer: const NavDrawer(),
                      );
    } else {
      return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60), child: TopBar()),
        body: WebviewUrl(url: paginas[currentIndex]),
        drawer: const NavDrawer(),
      );
    }
  }
}
