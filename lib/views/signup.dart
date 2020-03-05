import 'package:flutter/material.dart';
import 'package:Memes/views/view_memes.dart';
import 'package:Memes/views/login.dart';
import 'package:Memes/formFields/fullName.dart';
import 'package:Memes/formFields/phone.dart';
import 'package:Memes/formFields/email.dart';
import 'package:Memes/formFields/password.dart';
import 'package:Memes/formFields/confirmPassword.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignupPage> {
  String fullName = '';
  String phone = '';
  String email = '';
  String password = '';
  String consfirmPassword = '';

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _regKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fullNameController.addListener(updateFullName);
    phoneController.addListener(updatePhone);
    emailController.addListener(updateEmail);
    passwordController.addListener(updatePassword);
    confirmPasswordController.addListener(updateConfirmPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: Container(
        margin: EdgeInsets.only(top: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Header Text
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 5),
                child: Text(
                  "Lets Get Started!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Create an account to Q Allure to get all features",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Form(
                key: _regKey,
                child: Column(children: <Widget>[
                  FullName(controller: fullNameController, hint: 'Full Name'),

                  Email(controller: emailController, hint: 'Email'),

                  Phone(controller: phoneController, hint: 'Phone'),

                  Password(controller: passwordController, hint: 'Password'),

                  ConfirmPassword(
                    controller: confirmPasswordController,
                    hint: 'Confirm Password',
                    password: password,
                  ),

                  // Signup button
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: MaterialButton(
                      child: Text(
                        "CREATE",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      elevation: 2,
                      highlightElevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      minWidth: 220,
                      color: Color(0xFF0052d0),
                      padding: EdgeInsets.symmetric(
                        horizontal: 28.0,
                        vertical: 10.0,
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_regKey.currentState.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          final snackBar =
                              SnackBar(content: Text('Processing Data...'));
                          globalKey.currentState.showSnackBar(snackBar);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GetMemes()),
                          );
                        }
                      },
                    ),
                  ),
                ]),
              ),

              Container(
                margin: EdgeInsets.only(top: 35, bottom: 20),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      "Login here",
                      style: TextStyle(
                        color: Color(0xFF215bed),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateFullName() {
    setState(() {
      fullName = fullNameController.text;
    });
  }

  void updatePhone() {
    setState(() {
      phone = phoneController.text;
    });
  }

  void updateEmail() {
    setState(() {
      email = emailController.text;
    });
  }

  void updatePassword() {
    setState(() {
      password = passwordController.text;
    });
  }

  void updateConfirmPassword() {
    setState(() {
      consfirmPassword = confirmPasswordController.text;
    });
  }
}
