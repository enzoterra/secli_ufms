import 'package:Secli/list_links.dart';
import 'package:Secli/webview/webview_system.dart';
import 'package:flutter/material.dart';

class Passaporte extends StatefulWidget {
  const Passaporte({super.key});

  @override
  PassaporteState createState() => PassaporteState();
}

class PassaporteState extends State<Passaporte> {
  List<String> urls = ListLinks().getUrls();
  List<String> namesUrls = ListLinks().getNamesUrls();
  @override
  Widget build(BuildContext context) {
    return WebviewSystem(url: urls[2], nomeUrl: namesUrls[2]);
  }
}
