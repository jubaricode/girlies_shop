import 'package:flutter/material.dart';
import 'package:girlies_store/tools/app_methods.dart';
import 'package:girlies_store/tools/app_data.dart';
import 'package:girlies_store/tools/app_tools.dart';
import 'package:girlies_store/tools/firebase_methods.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController rePassword = new TextEditingController();

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
                controller: fullname),
            SizedBox(
              height: 30,
            ),
            appTextField(
                textIcon: Icons.phone,
                textType: TextInputType.number,
                textHint: "Phone Number",
                isPassword: false,
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
                controller: rePassword),
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


  verifyDetails() async{
    if (fullname.text == "") {
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
    if (rePassword.text == "") {
      showSnackBar("Re Password can't empty", scaffoldKey);
      return;
    }
    if (password.text != rePassword.text) {
      showSnackBar("Password doesn't match", scaffoldKey);
      return;
    }
   displayProgressDialog(context);
    String response = await appMethod.createUserAccount(
        fullname: fullname.text,
        phone: phoneNumber.text,
        email: email.text.toLowerCase(),
        password: password.text.toLowerCase());

    if (response == successful) {
      closeProgressDialog(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
