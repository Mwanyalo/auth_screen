import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  Password({this.controller, this.hint});

  final TextEditingController controller;
  final String hint;
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
        keyboardType: TextInputType.text,
        controller: controller,
        obscureText: true,
        validator: validatePassword,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 1),
            hintStyle: TextStyle(color: Color(0xFFa4a4a4)),
            prefixIcon: Icon(Icons.lock_open),
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

  String validatePassword(String value) {
    if (value.length == 0) {
      return "Password is Required";
    }
    return null;
  }
}
