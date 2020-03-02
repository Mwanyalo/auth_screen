import 'package:flutter/material.dart';
import 'input_field.dart';

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
  final TextEditingController consfirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateEmail);
    passwordController.addListener(updatePassword);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Container(
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
            // Full Name
            InputField(controller: emailController, hint: 'Full Name'),
            // Email Address
            InputField(controller: emailController, hint: 'Email'),
            // Phone
            InputField(controller: emailController, hint: 'Phone'),
            // Password
            InputField(controller: passwordController, hint: 'Password'),
            // Confirm Password
            InputField(controller: emailController, hint: 'Confirm Password'),

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
                onPressed: () {},
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 35, bottom: 20),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Login here",
                  style: TextStyle(
                    color: Color(0xFF215bed),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ],
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
