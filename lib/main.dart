import 'package:flutter/material.dart';

import 'view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.tag,
      routes: {HomePage.tag: (context) => HomePage()},
    );
  }
}