import 'package:Secli/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LinksTile extends StatefulWidget {
  const LinksTile({
    super.key,
  });

  @override
  LinksTileState createState() => LinksTileState();
}

class LinksTileState extends State<LinksTile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
        width: width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Adicionar link personalizado",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: CustomColors().darkBlueMain),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                height: 54,
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: "Nome", border: OutlineInputBorder()),
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 54,
                child: TextFormField(
                    keyboardType: TextInputType.url,
                    controller: linkController,
                    decoration: const InputDecoration(
                        hintText: "Link", border: OutlineInputBorder()),
                    style: const TextStyle(fontSize: 18))),
            const SizedBox(
              height: 34,
            ),
            Container(
                decoration: BoxDecoration(
                    color: CustomColors().darkBlueMain,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                height: 40,
                width: 120,
                child: TextButton(
                    onPressed: () async {
                      var prefs = await SharedPreferences.getInstance();
                      List<String>? linkNames = [];
                      List<String>? links = [];

                      if (prefs.containsKey('linkNames') &&
                          prefs.containsKey('links')) {
                        linkNames = prefs.getStringList('linkNames');
                        linkNames!.add(nameController.text);

                        links = prefs.getStringList('links');
                        links!.add(linkController.text);
                      } else {
                        linkNames.add(nameController.text);
                        links.add(linkController.text);
                      }

                      nameController.text = '';
                      linkController.text = '';

                      prefs.setStringList('linkNames', linkNames);
                      prefs.setStringList('links', links);

                      const snackBar =
                          SnackBar(content: Text("Link adicionado!"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text(
                      "Adicionar",
                      style: TextStyle(
                          color: CustomColors().salvarColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1.07),
                    ))),
          ],
        ));
  }
}
