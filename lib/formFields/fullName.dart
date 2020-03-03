import 'package:flutter/material.dart';

class FullName extends StatelessWidget {
  FullName({this.controller, this.hint});

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
        validator: validateName,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 1),
            hintStyle: TextStyle(color: Color(0xFFa4a4a4)),
            prefixIcon: Icon(Icons.perm_identity),
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

  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (value.length <= 2) {
      return "Name is too short";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }
}
