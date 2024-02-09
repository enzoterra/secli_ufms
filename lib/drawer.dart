import 'package:Secli/components/tiles/custom_tile.dart';
import 'package:Secli/components/tiles/title_divisor.dart';
import 'package:Secli/list_links.dart';
import 'package:flutter/material.dart';
import 'package:Secli/home.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<String>> urlsCustom = ListLinks().getUrlsCustom();
    Future<List<String>> urlsCustomNames = ListLinks().getUrlsCustomNames();
    List<String> urls = ListLinks().getUrls();
    List<String> namesUrls = ListLinks().getNamesUrls();
    List<IconData> iconsUrls = ListLinks().getIconsUrls();

    return Drawer(
        width: 280,
        child: Container(
            color: const Color.fromARGB(255, 60, 118, 226),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TopBar Drawer
                    Container(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 18, top: 30),
                        height: 130,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 60, 118, 226)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 70,
                                  child: Image.asset(
                                      "assets/images/logo-agetic.png")),
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

                    // Menu
                    Container(
                        color: Colors.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(),
                              ListTile(
                                leading: const Icon(Icons.home),
                                title: const Text("Início"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const Home())));
                                },
                              ),
                              const Divider(),

                              /* SUPORTE */
                              const TitleDivisor(title: "Suporte"),
                              CustomTile(
                                url: urls[0],
                                nomeUrl: namesUrls[0],
                                icon: iconsUrls[0],
                              ),
                              CustomTile(
                                url: urls[1],
                                nomeUrl: namesUrls[1],
                                icon: iconsUrls[1],
                              ),
                              CustomTile(
                                url: urls[2],
                                nomeUrl: namesUrls[2],
                                icon: iconsUrls[2],
                              ),
                              CustomTile(
                                url: urls[3],
                                nomeUrl: namesUrls[3],
                                icon: iconsUrls[3],
                              ),
                              const Divider(),

                              /* REDES */
                              const TitleDivisor(title: "Redes"),
                              CustomTile(
                                url: urls[4],
                                nomeUrl: namesUrls[4],
                                icon: iconsUrls[4],
                              ),
                              CustomTile(
                                url: urls[5],
                                nomeUrl: namesUrls[5],
                                icon: iconsUrls[5],
                              ),
                              CustomTile(
                                url: urls[6],
                                nomeUrl: namesUrls[6],
                                icon: iconsUrls[6],
                              ),
                              const Divider(),

                              /* Ativos */
                              const TitleDivisor(title: "Ativos"),
                              CustomTile(
                                url: urls[7],
                                nomeUrl: namesUrls[7],
                                icon: iconsUrls[7],
                              ),
                              const Divider(),

                              /* UFMS */
                              const TitleDivisor(title: "UFMS"),
                              CustomTile(
                                url: urls[8],
                                nomeUrl: namesUrls[8],
                                icon: iconsUrls[8],
                              ),
                              CustomTile(
                                url: urls[9],
                                nomeUrl: namesUrls[9],
                                icon: iconsUrls[9],
                              ),
                              CustomTile(
                                url: urls[10],
                                nomeUrl: namesUrls[10],
                                icon: iconsUrls[10],
                              ),
                              const Divider(),
                            ])),

                    /* Links Custom */
                    Expanded(
                      child: ListView.builder(
                          itemCount: urls.length,
                          itemBuilder: (context, index) {
                            return CustomTile(
                                url: urls[index],
                                nomeUrl: namesUrls[index],
                                icon: Icons.link);
                          }),
                      /*child: FutureBuilder<List<String>>(
                      future: urlsCustom,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    return CustomTile(
                                        url: snapshot.data![index],
                                        nomeUrl: namesUrls[index],
                                        icon: Icons.link);
                                  }));
                        } else {
                          return Container();
                        }
                      })*/
                    ),

                    /* Rodapé */
                    Container(
                      width: 280,
                      color: Colors.white,
                      padding:
                          const EdgeInsets.only(left: 18, top: 14, bottom: 18),
                      child: const Text("Feito por Enzo Terra",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8)),
                    ),
                  ]),
            )));
  }
}
