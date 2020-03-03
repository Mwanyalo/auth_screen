import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  Email({this.controller, this.hint, this.validator});

  final TextEditingController controller;
  final String hint;
  final String validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 48,
      margin: EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        validator: validateEmail,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 1),
            hintStyle: TextStyle(color: Color(0xFFa4a4a4)),
            prefixIcon: Icon(Icons.mail_outline),
            filled: true,
            fillColor: Color(0xFFffffff),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(color: Color(0xFFe9eaec), width: 0.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
            )),
      ),
    );
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }
}
