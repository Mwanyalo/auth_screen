import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({this.controller, this.hint});

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        margin: EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 10.0,
          bottom: 10.0,
        ),
        child: TextField(
          controller: controller,
          keyboardType: hint == "Email"
              ? TextInputType.emailAddress
              : TextInputType.visiblePassword,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 18.0,
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 1),
              hintStyle: TextStyle(color: Color(0xFFa4a4a4)),
              prefixIcon: getIcon(),
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
        ));
  }

  Widget getIcon() {
    switch (this.hint) {
      case "Full Name":
        return Icon(Icons.perm_identity);
        break;
      case "Email":
        return Icon(Icons.mail_outline);
        break;
      case "Phone":
        return Icon(Icons.stay_primary_portrait);
        break;
      default:
        return Icon(Icons.lock_open);
    }
  }
}
