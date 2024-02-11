import 'package:Secli/home.dart';
import 'package:Secli/settings/settings.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.isSettings});

  final bool isSettings;

  @override
  Widget build(BuildContext context) {
    if (isSettings) {
      return AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 118, 226),
        title: Image.asset(
          "assets/images/logo-agetic-full.png",
          width: 100,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: ((context) => const Home()))),
        ),
      );
    } else {
      return AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 118, 226),
        title: Image.asset(
          "assets/images/logo-agetic-full.png",
          width: 100,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Settings()))),
          )
        ],
      );
    }
  }
}
