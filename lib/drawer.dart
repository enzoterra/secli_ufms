import 'package:Secli/components/tile.dart';
import 'package:Secli/components/title_divisor.dart';
import 'package:flutter/material.dart';
import 'package:Secli/home.dart';

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

            /* SUPORTE */
            const TitleDivisor(title: "Suporte"),
            const CustomTile(index: 0, title: "GLPI", icon: Icons.support_agent),
            const CustomTile(index: 1, title: "Whaticket", icon: Icons.send),
            const CustomTile(index: 2, title: "Passaporte", icon: Icons.manage_accounts),
            const CustomTile(index: 3, title: "Siscad", icon: Icons.school),
            const Divider(),

            /* REDES */
            const TitleDivisor(title: "Redes"),
            const CustomTile(index: 4, title: "SGR", icon: Icons.public),
            const CustomTile(index: 5, title: "Mapa de Redes", icon: Icons.wifi),
            const CustomTile(index: 6, title: "Situação Redes", icon: Icons.cloud),
            const Divider(),

            /* Ativos */
            const TitleDivisor(title: "Ativos"),
            const CustomTile(index: 7, title: "Patrimônios", icon: Icons.view_week),
            const Divider(),

            /* UFMS */
            const TitleDivisor(title: "UFMS"),
            const CustomTile(index: 8, title: "RMO", icon: Icons.work_history),
            const CustomTile(index: 9, title: "Intranet", icon: Icons.badge),
            const CustomTile(index: 10, title: "Sistemas", icon: Icons.dns),
            const Divider(),

            /* Rodapé */
            Container(
              padding: const EdgeInsets.all(18),
              child: const Text("Feito por Enzo Terra",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            ),
          ],
        ));
  }
}
