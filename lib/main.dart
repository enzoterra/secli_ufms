import 'package:Secli/list_links.dart';
import 'package:flutter/material.dart';
import 'package:Secli/home.dart';
import 'package:Secli/components/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const SecliApp());
}

class SecliApp extends StatelessWidget {
  const SecliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ListLinks(),
        child: MaterialApp(
          title: 'SECLI',
          theme: tema,
          home: const Home(),
        ));
  }
}
