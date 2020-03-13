import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.blue[300],
        primaryColor: Colors.blue[300],
        backgroundColor: Colors.blue[300],
        dialogBackgroundColor: Colors.blue[300],
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
          ),
          body1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: SafeArea(child: LoadingScreen()),
    );
  }
}
