import 'package:Secli/webview/webview_list.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.url, required this.nomeUrl, required this.icon});

  final String url;
  final String nomeUrl;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(nomeUrl),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => WebviewList(
                      url: url,
                      nomeUrl: nomeUrl,
                    ))));
      },
    );
  }
}
