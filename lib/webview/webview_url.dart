import 'package:flutter/material.dart';
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
    return Stack(children: <Widget>[
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
      ]);
  }
}
