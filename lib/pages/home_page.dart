/*
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String  appTitle = "Complaint Box";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$appTitle'),
          centerTitle: true,
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              InkWell(
                onTap: () {

                },
                child: UserAccountsDrawerHeader(
                  accountName: Text("dsd"),
                  accountEmail: Text("sffs"),
                  currentAccountPicture:
                  CircleAvatar(
                    /// IMAGE PARTs
                  ),
                ),
              ),
              ListTile(
                title: Text('Building List'),
                leading: Icon(Icons.location_city),
                selected: _current == _buildingList,
                onTap: () => selectMenu(_buildingList, 'Building List'),
              ),
              ListTile(
                title: Text('Notice Board'),
                leading: Icon(Icons.note),
                selected: _current == _noticeBoard,
                onTap: () => selectMenu(_noticeBoard, 'Notice Board'),
              ),
              ListTile(
                title: Text('Compliant Box'),
                leading: Icon(Icons.error),
                selected: _current == _complaintList,
                onTap: () => selectMenu(_complaintList, 'Compliant Box'),
              ),
              ListTile(
                title: Text('Food Feedback'),
                leading: Icon(Icons.fastfood),
                selected: _current == _foodFeedbackList,
                onTap: () => selectMenu(_foodFeedbackList, 'Food Feedback'),
              ),
              ListTile(
                leading: Icon(Icons.announcement),
                title: Text('Cleaning Feedback'),
                selected: _current == _cleaningFeedbackList,
                onTap: () => selectMenu(_cleaningFeedbackList, 'Cleaning Feedback'),
              ),
              ListTile(
                title: Text('Sign Out'),
                leading: Icon(Icons.power_settings_new),
                onTap: () => dialogBox.onLogoutTapDialog(user, context),
              )
            ],
          ),
        ),
        body: _current);
  }

  void selectMenu(Widget newCurrent, String title) {
    setState(() {
      _current = newCurrent;
      appTitle = title;
    });
    Navigator.pop(context);
  }
}
*/
import 'package:flutter/material.dart';
import 'package:one_pass/pages/password_list.dart';
import 'package:one_pass/utils/data.dart';
import 'package:one_pass/utils/delayed_animation.dart';
import 'package:one_pass/widget/dash_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("One pass"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          DelayedAnimation(
            delay: 100,
            child: DashCard(
              title: "Passwords",
              navigateTo: PasswordList(),
              img: passImg,
            ),
          )
        ],
      ),
    );
  }
}
