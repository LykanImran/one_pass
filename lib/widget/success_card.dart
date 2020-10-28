import 'package:flutter/material.dart';
import 'package:one_pass/utils/style_guide.dart';

class SuccessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:  Container(
          width: MediaQuery.of(context).size.width*0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 250,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 150,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Successfully Added',
                style: display1,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
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
          ),
        ),
      ),
    );
  }
}
