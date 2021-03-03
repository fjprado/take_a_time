import 'package:flutter/material.dart';
import 'package:take_a_time/views/home.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Take a Time',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff040404),
        accentColor: Color(0xffFFA800),
        errorColor: Color(0xff966a03),
      ),
      home: HomePage(),
    );
  }
}
