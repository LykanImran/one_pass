import 'package:flutter/material.dart';
import 'package:one_pass/utils/style_guide.dart';
import 'package:one_pass/widget/pass_card.dart';

import 'add_password.dart';

class PasswordList extends StatefulWidget {
  @override
  _PasswordListState createState() => _PasswordListState();
}

class _PasswordListState extends State<PasswordList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: primaryBackground,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPassword()));
        },
      ),
      appBar: AppBar(title: Text("Password List"), centerTitle: true,),
      body: Container(
        child: ListView(
          children: [
            PasswordCard()

          ],
        ),
      ),
    );
  }



}
