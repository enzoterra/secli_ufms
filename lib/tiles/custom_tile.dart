import 'package:Secli/list_links.dart';
import 'package:Secli/webview/webview_drawer.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile(
      {super.key,
      required this.url,
      required this.nameUrl,
      required this.icon,
      required this.isCustom});

  final String url;
  final String nameUrl;
  final IconData icon;
  final bool isCustom;

  @override
  Widget build(BuildContext context) {
    if (isCustom) {
      return ListTile(
          leading: Icon(icon),
          title: Text(nameUrl),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => WebviewDrawer(
                          url: url,
                          nomeUrl: nameUrl,
                        ))));
          },
          onLongPress: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Excluir link personalizado?'),
                    content: const Text(
                        'Isso excluirá esse link, para criar outro entre em\nConfigurações -> Adicionar link'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancelar'),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () async {
                          ListLinks().deleteOneByUrlsCustom(url);
                          ListLinks().deleteOneByUrlsCustomName(nameUrl);

                          const snackBar =
                              SnackBar(content: Text("Link removido"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          Navigator.pop(context, 'Sim');
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  )));
    } else {
      return ListTile(
        leading: Icon(icon),
        title: Text(nameUrl),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => WebviewDrawer(
                        url: url,
                        nomeUrl: nameUrl,
                      ))));
        },
      );
    }
  }
}
