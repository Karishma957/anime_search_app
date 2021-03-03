import 'package:flutter/material.dart';
import './screens/parallax_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Story App',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(63, 26, 84, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: ParallaxScreen(),
    );
  }
}
