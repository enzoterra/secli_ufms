import 'package:flutter/material.dart';
import 'package:Secli/home.dart';
import 'package:Secli/pages/webview.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 280,
        child: ListView(
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                height: 120,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 118, 226)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                      height: 70,
                      child: Image.asset("assets/images/logo-agetic.png")),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "S E C L I",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ])),

            const Divider(),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Início"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const Home())));
              },
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(18),
              child: const Text("Suporte",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text("GLPI"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 0,
                            ))));
              },
            ),
            ListTile(
              leading: const Icon(Icons.send),
              title: const Text("Whaticket"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 1,
                            ))));
              },
            ),
            ListTile(
              leading: const Icon(Icons.manage_accounts),
              title: const Text("Passaporte"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 2,
                            ))));
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text("Siscad"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 3,
                            ))));
              },
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(18),
              child: const Text("Redes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            ListTile(
              leading: const Icon(Icons.public),
              title: const Text("SGR"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 4,
                            ))));
              },
            ),
            ListTile(
              leading: const Icon(Icons.wifi),
              title: const Text("Mapa de Redes"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 5,
                            ))));
              },
            ),
            ListTile(
              leading: const Icon(Icons.cloud),
              title: const Text("Situação Redes"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 6,
                            ))));
              },
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(18),
              child: const Text("Ativos",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            ListTile(
              leading: const Icon(Icons.view_week),
              title: const Text("Patrimônios"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 7,
                            ))));
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text("Gestão de Ativos"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 8,
                            ))));
              },
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(18),
              child: const Text("UFMS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            ListTile(
              leading: const Icon(Icons.work_history),
              title: const Text("RMO"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 9,
                            ))));
              },
            ),
            ListTile(
              leading: const Icon(Icons.badge),
              title: const Text("Intranet"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 10,
                            ))));
              },
            ),
            ListTile(
              leading: const Icon(Icons.dns),
              title: const Text("Sistemas"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WebviewController(
                              index: 11,
                            ))));
              },
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(18),
              child: const Text("Feito por Enzo Terra",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            ),
          ],
        ));
  }
}
