import 'package:flutter/material.dart';
import 'package:girlies_store/tools/progressdialog.dart';

Widget appTextField({
  IconData textIcon,
  String textHint,
  bool isPassword,
  double sidePadding,
  TextInputType textType,
  TextEditingController controller,}
) {
  sidePadding == null ? sidePadding = 0 : sidePadding;
  textHint == null ? textHint = "" : textHint;
  //textType == null ? textType == TextInputType.text : textType;

  return Padding(
    padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword == null ? false : isPassword,
        keyboardType: textType == null ? TextInputType.text: textType,
        decoration: InputDecoration(
          border: InputBorder.none,
            hintText: textHint,
            prefixIcon: textIcon == null ? Container() : Icon(textIcon)),
      ),
    ),
  );
}

Widget appButton({ String btnTxt,double btnPadding, Color btnColor, VoidCallback onBtnClicked}){
  btnTxt == null ? btnTxt == "App Button": btnTxt;
  btnPadding == null ? btnPadding == 0 : btnPadding;
  btnColor == null ? btnColor = Colors.black : btnColor;

  return Padding(
    padding:  EdgeInsets.all(btnPadding),
      child: RaisedButton(
         color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
          onPressed: onBtnClicked,
          child: Container(
            height: 50,
            child: Center(        
              child: Text(btnTxt,style: TextStyle(fontSize: 18, color: btnColor),),
            ),
          ),
      ),
  );
}

showSnackBar(String message, final scaffoldKey){
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    backgroundColor: Colors.red[600],
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
  ));
}

displayProgressDialog(BuildContext context){
  Navigator.of(context).push(PageRouteBuilder(
    opaque: false,
    pageBuilder : (BuildContext context,_,__){
      return ProgressDialog();
    }));
}

closeProgressDialog(BuildContext context){
  Navigator.of(context).pop();
}
