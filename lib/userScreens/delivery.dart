import 'package:flutter/material.dart';

class GirliesDelivery extends StatefulWidget {
  @override
  _GirliesDeliveryState createState() => _GirliesDeliveryState();
}

class _GirliesDeliveryState extends State<GirliesDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delivery"),),
      body: Center(
        child: Text("My Delivery",style: TextStyle(fontSize: 25),),
      ),
      
    );
  }
}