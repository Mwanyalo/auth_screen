import 'package:flutter/material.dart';
import 'package:Memes/views/view_memes.dart';
import "package:Memes/views/signup.dart";
import 'package:Memes/formFields/password.dart';
import 'package:Memes/formFields/email.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  String email = '';
  String password = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _logKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateEmail);
    passwordController.addListener(updatePassword);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      key: globalKey,
      body: Container(
        margin: EdgeInsets.only(top: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 10),
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: ExactAssetImage("assets/images/meet.jpg"),
                  ),
                ),
              ),
              // Header Text
              Container(
                child: Text(
                  "Welcom Back!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Login to your existing account of Q Allure",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Form(
                key: _logKey,
                child: Column(children: <Widget>[
                  Email(controller: emailController, hint: 'Email'),
                  Password(controller: passwordController, hint: 'Password'),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      alignment: Alignment.centerRight),
                  // Login button
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: MaterialButton(
                      child: Text(
                        "LOG IN",
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

                        if (_logKey.currentState.validate()) {
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

              // Login options
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  "Or connect using",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              // Facebook Login
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                MaterialButton(
                  child: Text(
                    "Facebook",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minWidth: size / 3,
                  elevation: 2,
                  highlightElevation: 2,
                  color: Color(0xFF385c8e),
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {},
                ),
                // Google Login
                MaterialButton(
                  child: Text(
                    "Google",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minWidth: size / 3,
                  elevation: 2,
                  highlightElevation: 2,
                  color: Color(0xFFf4413c),
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {},
                ),
              ]),
              Container(
                margin: EdgeInsets.only(top: 35, bottom: 20),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Dont have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Text(
                      "Sign Up",
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
}
