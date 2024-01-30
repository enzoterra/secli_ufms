import 'package:flutter/material.dart';
import 'package:Secli/components/topbar.dart';
import 'package:Secli/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewUrl extends StatefulWidget {
  const WebviewUrl({super.key, required this.url});

  final String url;

  @override
  WebviewUrlState createState() => WebviewUrlState();
}

class WebviewUrlState extends State<WebviewUrl> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: TopBar()),
      body: Stack(children: <Widget>[
        WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Stack(),
      ]),
      drawer: const NavDrawer(),
    );
  }
}
