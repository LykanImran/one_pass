import 'package:flutter/material.dart';
import 'package:one_pass/model/pass_model.dart';
import 'package:one_pass/utils/style_guide.dart';

class PasswordCard extends StatelessWidget {
  PassModel pass;
  PasswordCard({pass});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
            },
            child: Container(

               padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: primaryColor,
                          style: BorderStyle.solid,
                          width: 4.0))),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("dskkj", style: display1,)
                ],
              ),
            ),
          )),
    );
  }
}
