import 'package:Secli/pages/webview.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.index, required this.title, required this.icon});

  final IconData icon;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => WebviewController(
                      index: index,
                    ))));
      },
    );
  }
}
