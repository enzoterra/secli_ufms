import 'package:flutter/material.dart';

class ListLinks {
  final List<String> urls = [
    'https://suporte.ufms.br/front/ticket.php',
    'http://atendimento.ufms.br/tickets',
    'https://passaporte.ufms.br/#/admin/contas',
    'https://siscad.ufms.br/administrativo/academicos',
    'https://sgr.ufms.br/sgr/',
    'https://www.google.com/maps/d/viewer?mid=1eShRhZJD22ongitLPOZ12zHU0Sd_vGE&ll=-20.503439514484356%2C-54.61543129999999&z=16',
    'https://monitoramento-redes.ufms.br/zabbix.php?action=map.view&sysmapid=62',
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

  List<String> getUrls(){
    return urls;
  }

  List<String> getNamesUrls(){
    return nameUrls;
  }

  List<IconData> getIconsUrls() {
    return iconsUrls;
  }
}