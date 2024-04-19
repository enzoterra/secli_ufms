import 'package:Secli/components/colors.dart';
import 'package:Secli/components/icons.dart';
import 'package:Secli/webview/glpi.dart';
import 'package:Secli/webview/passaporte.dart';
import 'package:Secli/webview/sgr.dart';
import 'package:flutter/material.dart';
import 'package:Secli/components/topbar.dart';
import 'package:Secli/drawer/drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

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
        bottomNavigationBar: Container(
            color: CustomColors().whiteBottomNavigation,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                child: GNav(
                    selectedIndex: currentIndex,
                    backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                    color: const Color.fromARGB(255, 51, 51, 51),
                    activeColor: Colors.white,
                    tabBackgroundColor: CustomColors().blueMain,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 13),
                    tabBorderRadius: 5,
                    gap: 10,
                    textStyle: TextStyle(fontSize: 12, color: CustomColors().white),
                    tabs: [
                      GButton(
                        icon: CustomIcons().botnav1,
                        text: "SGR",
                      ),
                      GButton(
                        icon: CustomIcons().botnav2,
                        text: "GLPI",
                      ),
                      GButton(
                        icon: CustomIcons().botnav3,
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
        drawer: const NavDrawer(),
      );

    }
  }
}
