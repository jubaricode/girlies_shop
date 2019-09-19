import 'package:flutter/material.dart';

class GirliesNotifications extends StatefulWidget {
  @override
  _GirliesNotificationsState createState() => _GirliesNotificationsState();
}

class _GirliesNotificationsState extends State<GirliesNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Notifications"),),
      body: Center(
        child: Text("My Notifications,",style: TextStyle(fontSize: 25),),
      ),
  
      
    );
  }
}