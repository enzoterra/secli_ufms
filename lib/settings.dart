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
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: TopBar(
              isSettings: true,
            )),
        body: Container(
          height: 500,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Salvar credenciais"),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Senha"),
              )
            ],
          ),
        ));
  }
}
