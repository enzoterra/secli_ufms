import 'package:Secli/components/colors.dart';
import 'package:Secli/components/icons.dart';
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
          color: CustomColors().whiteBottomNavigation,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: GNav(
                  selectedIndex: urlIndex,
                  backgroundColor:  CustomColors().whiteBottomNavigation,
                  rippleColor: const Color.fromARGB(61, 41, 41, 41),
                  color: const Color.fromARGB(255, 51, 51, 51),
                  activeColor: Colors.white,
                  tabBackgroundColor:  CustomColors().blueMain,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                  tabBorderRadius: 5,
                  gap: 10,
                  textStyle: const TextStyle(fontSize: 12),
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
                    //Navigator.push(
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Home(
                                  //urlIndex: index,
                                ))), (Route<dynamic> route) => false);
                  })));
    } else {
      return Container(height: 0,);
    }
  }
}
