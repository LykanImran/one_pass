import 'package:flutter/material.dart';
import 'package:one_pass/pages/pin_page.dart';
import 'package:one_pass/utils/style_guide.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One Pass',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        splashColor: Colors.blue,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(headline6: display2),
        ),
      ),
      home: PinPage(),
    );
  }
}
