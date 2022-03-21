import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.fill)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 10,
                        color: HexColor("#f0a76a"),
                        shadowColor: Colors.transparent,
                        child: Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.only(left: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Good Morning",
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Theme.of(context).backgroundColor),
                                ),
                                Text(
                                  "Akash A",
                                  style: TextStyle(
                                      fontSize: 32,
                                      color: Theme.of(context).cardColor),
                                ),
                              ],
                            )),
                      ),
                      Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: HexColor("#f0a76a"),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
