import 'package:flutter/material.dart';

class TopBarDrawer extends StatelessWidget {
  const TopBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 18, top: 50),
        height: 150,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 60, 118, 226)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
              height: 70, child: Image.asset("assets/images/logo-agetic.png")),
          const SizedBox(
            width: 20,
          ),
          const Text(
            "S E C L I",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ]));
  }
}
