import 'package:flutter/material.dart';

class TitleDivisor extends StatelessWidget {
  const TitleDivisor({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
