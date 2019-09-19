import 'package:flutter/material.dart';
import 'package:girlies_store/userScreens/myHomePage.dart';

//  To get the debug certificate fingerprint:
//  keytool -list -v -alias androiddebugkey -keystore c:\users\jubari\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Girlies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
