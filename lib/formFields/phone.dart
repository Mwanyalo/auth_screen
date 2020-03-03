import 'package:flutter/material.dart';

class Phone extends StatelessWidget {
  Phone({this.controller, this.hint});

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
        keyboardType: TextInputType.phone,
        controller: controller,
        validator: validateMobile,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 1),
            hintStyle: TextStyle(color: Color(0xFFa4a4a4)),
            prefixIcon: Icon(Icons.stay_primary_portrait),
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

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Phone number is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }
}
