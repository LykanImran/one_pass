import 'package:flutter/material.dart';
import 'package:one_pass/model/pass_model.dart';
import 'package:one_pass/utils/database_service.dart';
import 'package:one_pass/utils/delayed_animation.dart';
import 'package:one_pass/utils/style_guide.dart';
import 'package:one_pass/widget/failure_card.dart';
import 'package:one_pass/widget/loading.dart';
import 'package:one_pass/widget/success_card.dart';

class AddPassword extends StatefulWidget {
  @override
  _AddPasswordState createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController title, desc;
  int state;
  PassModel pass;
  final dbhelper = DatabaseService.instance;

  @override
  void initState() {
    super.initState();
    state = 0;
    pass = PassModel();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: primaryBackground,
      appBar: AppBar(
        title: Text("FeedBack"),
        centerTitle: true,
      ),
      body: getView(),
    );
  }

  Widget getView() {
    switch (state) {
      case 0:
        {
          return form();
        }
      case 1:
        {
          return Center(
            child: Loading(),
          );
        }
      case 2:
        {
          return SuccessCard();
        }
      case 3:
        {
          return FailureCard();
        }
    }
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          DelayedAnimation(
              delay: 100,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 3,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Add your passwords here",
                        style: display1,
                      ),
                      SizedBox(
                        height: 25,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.newline,
                        validator: (input) {
                          if(input.isEmpty){
                            return "Enter Name";
                          }
                          return null;
                        },
                        onSaved: (input) {
                          pass.Name = input.trim();
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.title),
                          labelText: 'Name',
                          // hintText: 'Name of the ${widget.title} here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(),
                          ),
                          //contentPadding: EdgeInsets.only(left: 15, right: 15)
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.newline,
                        validator: (input) {
                          if(input.isEmpty){
                            return "Enter username or email";
                          }
                          return null;
                        },
                        onSaved: (input) {
                          pass.UserName = input.trim();
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'User Name / Email',
                          // hintText: 'Name of the ${widget.title} here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(),
                          ),
                          //contentPadding: EdgeInsets.only(left: 15, right: 15)
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.newline,
                        validator: (input) {
                          if(input.isEmpty){
                            return "Enter the  password";
                          }
                          return null;
                        },
                        onSaved: (input) {
                           pass.Password = input.trim();
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          // hintText: 'Name of the ${widget.title} here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(),
                          ),
                          //contentPadding: EdgeInsets.only(left: 15, right: 15)
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        //height: 50,
                        // width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            gradient: primaryGradient,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          onPressed: () {
                             addPass();
                             },
                          textColor: Colors.white,
                          // splashColor: Colors.deepOrange,
                          child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      'Add Password',
                                      style: btnTextWhite,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void addPass() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        state = 1;
      });

      final id = await dbhelper.insert(pass);

      print("Id>>>>>> ${id}");
      if (id!=null) {
        setState(() {
          state = 2;
        });
      } else {
        setState(() {
          state = 3;
        });
      }
    }
  }
}
