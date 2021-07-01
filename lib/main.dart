import 'package:flutter/material.dart';
import 'package:vtriousapp/screens/loginscreen.dart';

import 'screens/details.dart';
import 'screens/homepage.dart';
import 'screens/registerscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.red,
          textTheme: TextTheme(
              headline1: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
              ),
              bodyText1: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
              bodyText2: TextStyle(
                  color: Color(0x4DFFFFFF),
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w900))),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        'loginscreen': (context) => LoginScreen(),
        'registerscreen': (context) => RegisterScreen(),
        'userdetails': (context) => DetailsPage(),
      },
    );
  }
}
