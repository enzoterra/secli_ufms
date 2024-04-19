import 'package:Secli/drawer/topbar_drawer.dart';
import 'package:Secli/tiles/custom_tile.dart';
import 'package:Secli/tiles/title_divisor.dart';
import 'package:Secli/list_links.dart';
import 'package:flutter/material.dart';
import 'package:Secli/home.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> urls = ListLinks().getUrls();
    List<String> namesUrls = ListLinks().getNamesUrls();
    List<IconData> iconsUrls = ListLinks().getIconsUrls();
    double widthDrawer = 280;

    return Consumer<ListLinks>(
        builder: (context, lists, _) => Drawer(
            width: widthDrawer,
            child: Container(
                color: const Color.fromARGB(255, 60, 118, 226),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TopBar Drawer
                        const TopBarDrawer(),

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
                                    nameUrl: namesUrls[0],
                                    icon: iconsUrls[0],
                                    isCustom: false,
                                  ),
                                  CustomTile(
                                    url: urls[1],
                                    nameUrl: namesUrls[1],
                                    icon: iconsUrls[1],
                                    isCustom: false,
                                  ),
                                  CustomTile(
                                    url: urls[2],
                                    nameUrl: namesUrls[2],
                                    icon: iconsUrls[2],
                                    isCustom: false,
                                  ),
                                  CustomTile(
                                    url: urls[3],
                                    nameUrl: namesUrls[3],
                                    icon: iconsUrls[3],
                                    isCustom: false,
                                  ),
                                  const Divider(),

                                  /* REDES */
                                  const TitleDivisor(title: "Redes"),
                                  CustomTile(
                                    url: urls[4],
                                    nameUrl: namesUrls[4],
                                    icon: iconsUrls[4],
                                    isCustom: false,
                                  ),
                                  CustomTile(
                                    url: urls[5],
                                    nameUrl: namesUrls[5],
                                    icon: iconsUrls[5],
                                    isCustom: false,
                                  ),
                                  CustomTile(
                                    url: urls[6],
                                    nameUrl: namesUrls[6],
                                    icon: iconsUrls[6],
                                    isCustom: false,
                                  ),
                                  const Divider(),

                                  /* Ativos */
                                  const TitleDivisor(title: "Ativos"),
                                  CustomTile(
                                    url: urls[7],
                                    nameUrl: namesUrls[7],
                                    icon: iconsUrls[7],
                                    isCustom: false,
                                  ),
                                  const Divider(),

                                  /* UFMS */
                                  const TitleDivisor(title: "UFMS"),
                                  CustomTile(
                                    url: urls[8],
                                    nameUrl: namesUrls[8],
                                    icon: iconsUrls[8],
                                    isCustom: false,
                                  ),
                                  CustomTile(
                                    url: urls[9],
                                    nameUrl: namesUrls[9],
                                    icon: iconsUrls[9],
                                    isCustom: false,
                                  ),
                                  CustomTile(
                                    url: urls[10],
                                    nameUrl: namesUrls[10],
                                    icon: iconsUrls[10],
                                    isCustom: false,
                                  ),
                                ])),

                        /* Links Custom */
                        FutureBuilder<List<String>>(
                            future: lists.getUrlsCustom(),
                            builder: (context, snapshot) {
                              List<String> listUrls = [];
                              if (snapshot.hasData) {
                                listUrls = snapshot.data!;
                              }
                              if (listUrls.isNotEmpty) {
                                return Container(
                                    height: 280,
                                    width: widthDrawer,
                                    color: Colors.white,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const TitleDivisor(
                                              title: "Links Personalizados"),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 18, bottom: 4),
                                            child: const Text(
                                                "Role para ver todos os links",
                                                style: TextStyle(fontSize: 14)),
                                          ),
                                          FutureBuilder(
                                              future:
                                                  lists.getUrlsCustomNames(),
                                              builder: (context, snapshot2) {
                                                List<String> listUrlNames = [];
                                                if (snapshot2.hasData) {
                                                  listUrlNames =
                                                      snapshot2.data!;
                                                }
                                                if (listUrlNames.isNotEmpty) {
                                                  return Expanded(
                                                      child: Scrollbar(
                                                          child:
                                                              ListView.builder(
                                                                  itemCount:
                                                                      listUrls
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return CustomTile(
                                                                      url: listUrls[
                                                                          index],
                                                                      nameUrl:
                                                                          listUrlNames[
                                                                              index],
                                                                      icon: Icons
                                                                          .link,
                                                                      isCustom:
                                                                          true,
                                                                    );
                                                                  })));
                                                } else {
                                                  return Container();
                                                }
                                              })
                                        ]));
                              } else {
                                return Container();
                              }
                            }),

                        /* Rodapé */
                        Container(
                          width: widthDrawer,
                          color: Colors.white,
                          padding: const EdgeInsets.all(18),
                          child: const Text("Feito por Enzo Terra",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 8)),
                        ),
                      ]),
                ))));
  }
}
