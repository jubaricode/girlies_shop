import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:girlies_store/tools/app_methods.dart';
import 'app_data.dart';
import 'app_tools.dart';


class FirebaseMethods implements AppMethods{
  final Firestore firestore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
   @override
  Future<String> createUserAccount(
      {String fullname, String phone, String email, String password}) async {
  
    FirebaseUser user;

    try {
      user = ( await _auth.createUserWithEmailAndPassword(
          email: email, password: password)).user;
    } on PlatformException catch (e) {
      //print(e.details);
      return errorMSG(e.details);
    }

    try {
      if (user != null) {
        await firestore.collection(usersData).document(user.uid).setData({
          userID: user.uid,
          fullName: fullname,
          userEmail: email,
          userPassword: password,
          phoneNumber: phone
        });

        writeDataLocally(key: userID, value: user.uid);
        writeDataLocally(key: fullname, value: fullname);
        writeDataLocally(key: userEmail, value: userEmail);
        writeDataLocally(key: userPassword, value: password);
      }
    } on PlatformException catch (e) {
      //print(e.details);
      return errorMSG(e.details);
    }

    return user == null ? errorMSG("Error") : successfulMSG();
  }

  @override
  Future<String> logginUser({String email, String password})async {
   
    FirebaseUser user ;
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password)).user;
    } on PlatformException catch (e){
      //print(e.details);
      return errorMSG(e.details);
    }
    return user == null ? errorMSG("Error") : successfulMSG();
  }

  Future<bool> complete() async {
    return true;
  }
  
  Future<bool> notComplete() async {
    return false;
  }

   Future<String> successfulMSG() async {
    return successful;
  }

  Future<String> errorMSG(String e) async {
    return e;
  }
}