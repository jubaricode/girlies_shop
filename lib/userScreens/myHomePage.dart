import 'package:flutter/material.dart';
import 'package:girlies_store/tools/store.dart';
import 'package:girlies_store/userScreens/aboutUs.dart';
import 'package:girlies_store/userScreens/cart.dart';
import 'package:girlies_store/userScreens/delivery.dart';
import 'package:girlies_store/userScreens/favorites.dart';
import 'package:girlies_store/userScreens/history.dart';
import 'package:girlies_store/userScreens/itemDetail.dart';
import 'package:girlies_store/userScreens/login.dart';
import 'package:girlies_store/userScreens/messages.dart';
import 'package:girlies_store/userScreens/notifications.dart';
import 'package:girlies_store/userScreens/profile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Girlies"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => GirliesFavorities()));
            },
          ),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => GirliesMessages()));
                },
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  "0",
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          )
        ],
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Flexible(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: storeItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ItemDetail(
                     itemImage: storeItems[index].itemImage,
                     itemName: storeItems[index].itemName,
                     itemPrice: storeItems[index].itemPrice,
                     itemRating: storeItems[index].itemRating,
                      
                    )));
                  },
                  child: Card( 
                    child: Stack(
                      alignment: FractionalOffset.topLeft,
                      children: <Widget>[
                        Stack(
                          alignment: FractionalOffset.bottomCenter,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: NetworkImage(
                                          storeItems[index].itemImage))),
                            ),
                            Container(
                              height: 35,
                              color: Colors.black.withAlpha(100),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "${storeItems[index].itemName.substring(0, 8)}...",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Rp${storeItems[index].itemPrice}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.star, color: Colors.blue),
                                  Text(
                                    "${storeItems[index].itemRating}",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.favorite_border,
                                  color: Colors.blue),
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => GirliesCart()));
            },
            child: Icon(Icons.shopping_cart),
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 10,
            child: Text("0"),
          )
        ],
      ),
      drawer: new Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Jubari"),
              accountEmail: Text("jubari@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.notifications,
                  size: 20,
                ),
              ),
              title: Text("Order Notifications"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => GirliesNotifications()));
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.history,
                  size: 20,
                ),
              ),
              title: Text("Order History"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => GirliesHistory()));
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 20,
                ),
              ),
              title: Text("Profile Settings"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => GirliesProfile()));
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.home,
                  size: 20,
                ),
              ),
              title: Text("Delivery Address"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => GirliesDelivery()));
              },
            ),
            Divider(),
            ListTile(
              trailing: CircleAvatar(
                child: Icon(
                  Icons.help,
                  size: 20,
                ),
              ),
              title: Text("About Us"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => GirliesAboutUs()));
              },
            ),
            ListTile(
              trailing: CircleAvatar(
                child: Icon(
                  Icons.exit_to_app,
                  size: 20,
                ),
              ),
              title: Text("Login"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => GirliesLogin()));
              },
            )
          ],
        ),
      ),
    );
  }
}
