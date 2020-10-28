import 'package:flutter/material.dart';

enum DrawerItemEnum {
  DASHBOARD,
  MESSAGE,
  SETTINGS,
  ABOUT,
  HELP,
}


Color _getColor(DrawerItemEnum menu) {
  switch (menu) {
    case DrawerItemEnum.DASHBOARD:
      return Colors.blue;
    case DrawerItemEnum.MESSAGE:
      return Colors.green;
    case DrawerItemEnum.SETTINGS:
      return Colors.purple;
    case DrawerItemEnum.ABOUT:
      return Colors.orange;
    case DrawerItemEnum.HELP:
      return Colors.yellow;
    default:
      return Colors.white;
  }
}

String _getTitle(DrawerItemEnum menu) {
  switch (menu) {
    case DrawerItemEnum.DASHBOARD:
      return "DASHBOARD";
    case DrawerItemEnum.MESSAGE:
      return "MESSAGE";
    case DrawerItemEnum.SETTINGS:
      return "SETTINGS";
    case DrawerItemEnum.ABOUT:
      return "ABOUT";
    case DrawerItemEnum.HELP:
      return "HELP";
    default:
      return "";
  }
}