import 'package:flutter/material.dart';
import 'package:girlies_store/tools/app_methods.dart';
import 'package:girlies_store/tools/app_data.dart';
import 'package:girlies_store/tools/app_tools.dart';
import 'package:girlies_store/tools/firebase_methods.dart';
import 'package:girlies_store/userScreens/signup.dart';

class GirliesLogin extends StatefulWidget {
  @override
  _GirliesLoginState createState() => _GirliesLoginState();
}

class _GirliesLoginState extends State<GirliesLogin> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethod = new FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18,
                textIcon: Icons.email,
                textHint: "Email Address",
                controller: email),
            SizedBox(
              height: 30,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18,
                textIcon: Icons.lock,
                textHint: "Password",
                controller: password),
            appButton(
                btnTxt: "Login",onBtnClicked: verifyLoggin,
                btnPadding: 20,
                btnColor: Theme.of(context).primaryColor),
            GestureDetector(
                onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUp()));
                },
                child: Text(
                  "Not Registered? Sign Up Here",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  verifyLoggin() async {
    if (email.text == "") {
      showSnackBar("Email cannot be empty", scaffoldKey);
      return;
    }

    if (password.text == "") {
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }

    displayProgressDialog(context);
    String response = await appMethod.logginUser(
        email: email.text.toLowerCase(), password: password.text.toLowerCase());
    if (response == successful) {
      closeProgressDialog(context);
      Navigator.of(context).pop(true);
    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}