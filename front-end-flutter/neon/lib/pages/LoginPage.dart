import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:neon/style/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  void onSubmit() {
    if (context != null) {
      print("hell0");
      GoRouter.of(context).go('/overview');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: NeonStyles.fontColor),
        ),
        backgroundColor: NeonStyles.secondaryColor,
      ),
      backgroundColor: NeonStyles.primaryColor,
      body: Center(
          child: Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "username"),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Padding(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "password"),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextButton(
                        child: Text("Submit"),
                        onPressed: onSubmit,
                      ))
                ],
              ))),
    );
  }
}
