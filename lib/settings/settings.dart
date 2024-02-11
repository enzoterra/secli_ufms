import 'package:Secli/components/tiles/credentials_tile.dart';
import 'package:Secli/components/tiles/links_tile.dart';
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
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: TopBar(
              isSettings: true,
            )),
        body: SingleChildScrollView(
            child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 70,
            ),
            CredentialsTile(),
            SizedBox(
              height: 100,
            ),
            LinksTile(),
            SizedBox(
              height: 100,
            ),
          ]),
        )));
  }
}
