import 'package:Secli/list_links.dart';
import 'package:Secli/webview/webview_system.dart';
import 'package:flutter/material.dart';

class GLPI extends StatefulWidget {
  const GLPI({super.key});

  @override
  GLPIState createState() => GLPIState();
}

class GLPIState extends State<GLPI> {
  List<String> urls = ListLinks().getUrls();
  List<String> namesUrls = ListLinks().getNamesUrls();
  @override
  Widget build(BuildContext context) {
    return WebviewSystem(url: urls[0], nomeUrl: namesUrls[0]);
  }
}
