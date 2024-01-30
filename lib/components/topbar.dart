import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 60, 118, 226),
      title: Image.asset(
        "assets/images/logo-agetic-full.png",
        width: 100,
      ),
      centerTitle: true,
    );
  }
}
