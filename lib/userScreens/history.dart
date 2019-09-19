import 'package:flutter/material.dart';

class GirliesHistory extends StatefulWidget {
  @override
  _GirliesHistoryState createState() => _GirliesHistoryState();
}

class _GirliesHistoryState extends State<GirliesHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History"),),
      body: Center(
        child: Text("My History",style: TextStyle(fontSize: 25),),
      ),
      
    );
  }
}