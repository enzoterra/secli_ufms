import 'package:Secli/components/colors.dart';
import 'package:Secli/components/icons.dart';
import 'package:Secli/components/images.dart';
import 'package:Secli/home.dart';
import 'package:Secli/settings/settings.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.isSettings});

  final bool isSettings;

  @override
  Widget build(BuildContext context) {
    if (isSettings) {
      return AppBar(
        backgroundColor: CustomColors().blueMain,
        title: CustomImages().topbar_drawer,
        centerTitle: true,
        leading: IconButton(
          icon: CustomIcons().arrowback,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: ((context) => const Home()))),
        ),
      );
    } else {
      return AppBar(
        backgroundColor: CustomColors().blueMain,
        title: CustomImages().topbar_drawer,
        centerTitle: true,
        actions: [
          IconButton(
            icon: CustomIcons().settings,
            color: CustomColors().white,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Settings()))),
          )
        ],
      );
    }
  }
}
