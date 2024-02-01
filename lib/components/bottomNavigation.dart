import 'package:Secli/home.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigation extends StatelessWidget {
  CustomBottomNavigation({super.key, required this.urlIndex});

  final int urlIndex;

  final List<String> paginas = [
    'https://sgr.ufms.br/sgr/',
    'https://suporte.ufms.br/front/ticket.php',
    'https://passaporte.ufms.br/#/admin/contas',
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    if (deviceInfo.orientation == Orientation.portrait) {
      return Container(
          color: const Color.fromARGB(255, 240, 240, 240),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: GNav(
                  selectedIndex: urlIndex,
                  backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                  rippleColor: const Color.fromARGB(61, 41, 41, 41),
                  color: const Color.fromARGB(255, 51, 51, 51),
                  activeColor: Colors.white,
                  tabBackgroundColor: const Color.fromARGB(255, 60, 118, 226),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
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
                    //Navigator.push(
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Home(
                                  //urlIndex: index,
                                ))), (Route<dynamic> route) => false);
                  })));
    } else {
      return Container(height: 0,);
    }
  }
}
