import 'package:flutter/material.dart';

class GirliesProfile extends StatefulWidget {
  @override
  _GirliesProfileState createState() => _GirliesProfileState();
}

class _GirliesProfileState extends State<GirliesProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),
      body: Center(
        child: Text("My Profile",style: TextStyle(fontSize: 25),),
      ),
      
    );
  }
}