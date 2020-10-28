import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kt_drawer_menu/kt_drawer_menu.dart';

import 'drawer_item.dart';

class DrawerPage extends StatelessWidget {
  final StreamController<DrawerItemEnum> streamController;
  DrawerItemEnum selected;

  DrawerPage({Key key, this.streamController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DrawerItemEnum>(
      stream: streamController.stream,
      initialData: DrawerItemEnum.DASHBOARD,
      builder: (context, snapshot) {
        selected = snapshot.data;
        return Container(
          color: Colors.blueGrey[900],
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getMenu(context, DrawerItemEnum.DASHBOARD),
                    _getMenu(context, DrawerItemEnum.MESSAGE),
                    _getMenu(context, DrawerItemEnum.SETTINGS),
                    _getMenu(context, DrawerItemEnum.ABOUT),
                    _getMenu(context, DrawerItemEnum.HELP),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );



  }

  Widget _getMenu(BuildContext context, DrawerItemEnum menu) {
    switch (menu) {
      case DrawerItemEnum.DASHBOARD:
        return _buildItem(context, menu, "Dashboard", Icons.dashboard, () {});
      case DrawerItemEnum.MESSAGE:
        return _buildItem(context, menu, "Messages", Icons.message, () {});
      case DrawerItemEnum.SETTINGS:
        return _buildItem(context, menu, "Settings", Icons.settings, () {});
      case DrawerItemEnum.ABOUT:
        return _buildItem(context, menu, "About", Icons.info, () {});
      case DrawerItemEnum.HELP:
        return _buildItem(context, menu, "Help", Icons.help_outline, () {});
      default:
        return Container();
    }
  }



  Widget _buildItem(
      BuildContext context,
      DrawerItemEnum menu,
      String title,
      IconData icon,
      Function onPressed,
      ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          streamController.sink.add(menu);
          KTDrawerMenu.of(context).closeDrawer();
          onPressed();
        },
        child: Container(
          height: 50,
          padding: EdgeInsets.only(left: 26),
          child: Row(
            children: [
              Icon(icon,
                  color: selected == menu ? Colors.white : Colors.white70,
                  size: 24),
              SizedBox(width: 14),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: selected == menu ? 15 : 14,
                  fontWeight:
                  selected == menu ? FontWeight.w500 : FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}



