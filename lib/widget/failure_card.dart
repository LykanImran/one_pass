import 'package:flutter/material.dart';
import 'package:one_pass/utils/style_guide.dart';

class FailureCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        elevation: 12,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child:  Container(
          width: MediaQuery.of(context).size.width*0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error,
                size: 150,
                color: Colors.red,
              ),
              SizedBox(
                height: 30,
              ),
              Text('Something Went Wrong',
                  style:
                  display1),
              SizedBox(
                height: 30,
              ),
              Text('Please try again',
                  style:
                  display2),
              SizedBox(
                height: 35,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Go Back',
                  style: btnTextWhite,
                ),
                color: primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),),
      ),
    );
  }
}
