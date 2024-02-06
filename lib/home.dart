import 'package:Secli/webview/glpi.dart';
import 'package:Secli/webview/passaporte.dart';
import 'package:Secli/webview/sgr.dart';
import 'package:flutter/material.dart';
import 'package:Secli/components/topbar.dart';
import 'package:Secli/drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    /*required this.urlIndex*/
  });

  //final int urlIndex;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentIndex = 1;
  bool isLoading = true;

  final List<Widget> paginas = [
    const SGR(),
    const GLPI(),
    const Passaporte(),
  ];

  /*final List<String> paginas = [
    'https://sgr.ufms.br/sgr/',
    'https://suporte.ufms.br/front/ticket.php',
    'https://passaporte.ufms.br/#/admin/contas',
  ];*/

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    if (deviceInfo.orientation == Orientation.portrait) {
      return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: TopBar(
              isSettings: false,
            )),
        body: paginas[currentIndex],
        /*Stack(children: <Widget>[
          WebView(
            initialUrl: paginas[currentIndex],
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
        ]),*/
        bottomNavigationBar: Container(
            color: const Color.fromARGB(255, 240, 240, 240),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                child: GNav(
                    selectedIndex: currentIndex,
                    backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                    rippleColor: const Color.fromARGB(61, 41, 41, 41),
                    color: const Color.fromARGB(255, 51, 51, 51),
                    activeColor: Colors.white,
                    tabBackgroundColor: const Color.fromARGB(255, 60, 118, 226),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 13),
                    tabBorderRadius: 5,
                    gap: 10,
                    textStyle: const TextStyle(fontSize: 12),
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
            preferredSize: Size.fromHeight(60),
            child: TopBar(
              isSettings: false,
            )),
        body: paginas[currentIndex],
        /*Stack(children: <Widget>[
          WebView(
            initialUrl: paginas[currentIndex],
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
        ]),*/
        drawer: const NavDrawer(),
      );

      /*return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: TopBar()),
      body: WebviewUrl(url: paginas[widget.urlIndex]),
      bottomNavigationBar: CustomBottomNavigation(urlIndex: widget.urlIndex),
      drawer: const NavDrawer(),
    );*/
    }
  }
}
