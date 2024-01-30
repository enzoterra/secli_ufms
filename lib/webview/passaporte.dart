import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Passaporte extends StatefulWidget {
  const Passaporte({super.key});

  @override
  PassaporteState createState() => PassaporteState();
}

class PassaporteState extends State<Passaporte> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      WebView(
        initialUrl: 'https://passaporte.ufms.br/#/admin/contas',
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
