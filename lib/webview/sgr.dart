import 'package:Secli/list_links.dart';
import 'package:Secli/webview/webview_system.dart';
import 'package:flutter/material.dart';
class SGR extends StatefulWidget {
  const SGR({super.key});

  @override
  SGRState createState() => SGRState();
}

class SGRState extends State<SGR> {
  List<String> urls = ListLinks().getUrls();
  List<String> namesUrls = ListLinks().getNamesUrls();
  @override
  Widget build(BuildContext context) {
    return WebviewSystem(url: urls[4], nomeUrl: namesUrls[4]);
  }
}
