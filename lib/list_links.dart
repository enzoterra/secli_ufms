import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListLinks extends ChangeNotifier{
  final List<String> urls = [
    'https://suporte.ufms.br/front/ticket.php',
    'http://atendimento.ufms.br/login',
    'https://passaporte.ufms.br/#/admin/contas',
    'https://siscad.ufms.br/administrativo/academicos',
    'https://sgr.ufms.br/sgr/',
    'https://www.google.com/maps/d/viewer?mid=1eShRhZJD22ongitLPOZ12zHU0Sd_vGE&ll=-20.503439514484356%2C-54.61543129999999&z=16',
    'https://monitoramento-redes.ufms.br/index.php?request=zabbix.php%3Faction%3Dmap.view%26sysmapid%3D62',
    'https://patrimonio.ufms.br/',
    'https://rmo.ufms.br/pages/home',
    'https://intranet.ufms.br/pages/home',
    'https://sistemas.ufms.br/'
  ];

  final List<String> nameUrls = [
    'GLPI',
    'Whaticket',
    'Passaporte',
    'Siscad',
    'SGR',
    'Mapa de Redes',
    'Situação Redes',
    'Patrimônios',
    'RMO',
    'Intranet',
    'Sistemas'
  ];

  final List<IconData> iconsUrls = [
    Icons.support_agent,
    Icons.send,
    Icons.manage_accounts,
    Icons.school,
    Icons.public,
    Icons.wifi,
    Icons.cloud,
    Icons.view_week,
    Icons.work_history,
    Icons.badge,
    Icons.dns,
    Icons.link
  ];

  List<String> getUrls() => urls;

  List<String> getNamesUrls() =>  nameUrls;

  List<IconData> getIconsUrls() => iconsUrls;

  // Urls Custom
  Future<List<String>> getUrlsCustom() async {
    List<String> urlsCustom = [];
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('links')) {
      urlsCustom = prefs.getStringList('links')!;
    }
    return urlsCustom;
  }

  setUrlsCustom(List<String> urlsCustom) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('links', urlsCustom);

    notifyListeners();
  }

  deleteOneByUrlsCustom(String url) async {
    List<String> urlsCustom = await getUrlsCustom();
    urlsCustom.remove(url);
    setUrlsCustom(urlsCustom);
  }

  //Urls Custom Names
  Future<List<String>> getUrlsCustomNames() async {
    List<String> urlsCustomNames = [];
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('linkNames')) {
      urlsCustomNames = prefs.getStringList('linkNames')!;
    }
    return urlsCustomNames;
  }

  setUrlsCustomName(List<String> urlsCustomName) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('linkNames', urlsCustomName);
  }

  deleteOneByUrlsCustomName(String urlName) async {
    List<String> urlsCustomName = await getUrlsCustomNames();
    urlsCustomName.remove(urlName);
    setUrlsCustomName(urlsCustomName);
  }

  Future<String> getNameByIndex(int index) async {
    String name;
    List<String> urlsCustomNames = [];
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('linkNames')) {
      urlsCustomNames = prefs.getStringList('linkNames')!;
    }
    name = urlsCustomNames[index];
    return name;
  }
}
