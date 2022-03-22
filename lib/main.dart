import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "pulpdisplay",
          primaryColor: HexColor("#ff9b75"),
          backgroundColor: HexColor("#87878e"),
          canvasColor: HexColor("#10101e"),
          cardColor: HexColor("#f5f5f6")),
      home: const MyHomePage(title: 'Smart Home'),
    );
  }
}


