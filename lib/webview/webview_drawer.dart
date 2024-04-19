import 'package:Secli/webview/webview_system.dart';
import 'package:flutter/material.dart';
import 'package:Secli/components/topbar.dart';
import 'package:Secli/drawer/drawer.dart';

class WebviewDrawer extends StatelessWidget {
  const WebviewDrawer({super.key, required this.url, required this.nomeUrl});

  final String url;
  final String nomeUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: TopBar(
            isSettings: false,
          )),
      body: WebviewSystem(url: url, nomeUrl: nomeUrl),
      drawer: const NavDrawer(),
    );
  }
}
