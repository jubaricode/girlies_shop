import 'package:flutter/material.dart';

class GirliesAboutUs extends StatefulWidget {
  @override
  _GirliesAboutUsState createState() => _GirliesAboutUsState();
}

class _GirliesAboutUsState extends State<GirliesAboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About us"),),
      body: Center(
        child: Text("About Us",style: TextStyle(fontSize: 25),),
      ),
      
    );
  }
}