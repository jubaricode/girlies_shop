import 'package:flutter/material.dart';
import 'package:girlies_store/tools/app_tools.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullName = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController re_password = new TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            appTextField(
                textIcon: Icons.person,
                textHint: "Full Name",
                isPassword: false,
                sidePadding: 18,
                controller: fullName),
            SizedBox(
              height: 30,
            ),
            appTextField(
                textIcon: Icons.phone,
                textType: TextInputType.number,
                textHint: "Phone Number",
                isPassword: true,
                sidePadding: 18,
                controller: phoneNumber),
            SizedBox(
              height: 30,
            ),
            appTextField(
                textIcon: Icons.email,
                textHint: "Email Address",
                isPassword: false,
                sidePadding: 18,
                controller: email),
            SizedBox(
              height: 30,
            ),
            appTextField(
                textIcon: Icons.lock,
                textHint: "Password",
                isPassword: true,
                sidePadding: 18,
                controller: password),
            SizedBox(
              height: 30,
            ),
            appTextField(
                textIcon: Icons.lock,
                textHint: "Re-Password",
                isPassword: true,
                sidePadding: 18,
                controller: re_password),
            appButton(
                btnTxt: "Creat Account",
                onBtnClicked: verifyDetails,
                btnPadding: 20,
                btnColor: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }


  verifyDetails() {
    if (fullName.text == "") {
      showSnackBar("Full Name can't be empty", scaffoldKey);
      return;
    }

    if (phoneNumber.text == "") {
      showSnackBar("Phone can't empty", scaffoldKey);
      return;
    }
    if (email.text == "") {
      showSnackBar("Email can't be empty", scaffoldKey);
      return;
    }

    if (password.text == "") {
      showSnackBar("Password can't empty", scaffoldKey);
      return;
    }
    if (re_password.text == "") {
      showSnackBar("Re Password can't empty", scaffoldKey);
      return;
    }
    if (password.text != re_password.text) {
      showSnackBar("Password doesn't match", scaffoldKey);
      return;
    }
    displayProgressDialog(context);
  }
}
