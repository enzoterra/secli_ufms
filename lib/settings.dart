import 'package:Secli/components/credentials_tile.dart';
import 'package:Secli/components/links_tile.dart';
import 'package:flutter/material.dart';
import 'package:Secli/components/topbar.dart';

class Settings extends StatefulWidget {
  const Settings({
    super.key,
  });

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: TopBar(
              isSettings: true,
            )),
        body: SizedBox(
            width: largura * 0.8,
            child: ListView(
              children: const [
                SizedBox(
                  height: 70,
                ),
                CredentialsTile(),
                SizedBox(
                  height: 100,
                ),
                LinksTile()
              ],
            )));
  }
}
