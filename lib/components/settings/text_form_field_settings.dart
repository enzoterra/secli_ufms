import 'package:flutter/material.dart';

class TFFSettings extends StatelessWidget {
  const TFFSettings({super.key, required this.controller, required this.hint, required this.isPassword});

  final TextEditingController controller;
  final String hint;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    if(isPassword){
    return SizedBox(
            height: 54,
            child: TextFormField(
              controller: controller,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: hint, border: const OutlineInputBorder()),
              style: const TextStyle(fontSize: 18),
            ));
    } else {
      return SizedBox(
            height: 54,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: hint, border: const OutlineInputBorder()),
              style: const TextStyle(fontSize: 18),
            ));
    }
  }
}
