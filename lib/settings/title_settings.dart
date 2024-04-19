import 'package:Secli/components/colors.dart';
import 'package:flutter/material.dart';

class TitleSettings extends StatelessWidget {
  const TitleSettings({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
          title,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CustomColors().darkBlueMain),
        );
  }
}
