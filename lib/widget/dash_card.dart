import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_pass/utils/style_guide.dart';

class DashCard extends StatelessWidget {
  String title;
  String img;
  Widget navigateTo;

  DashCard({this.title = "", this.img = "", this.navigateTo});

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
              if (navigateTo != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => navigateTo));
              }
            },
            child: Container(
              height: 200,

              /// padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                  Container(
                    width: 150,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("${img}"),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${title}", style: body1,)
                ],
              ),
            ),
          )),
    );
  }
}
