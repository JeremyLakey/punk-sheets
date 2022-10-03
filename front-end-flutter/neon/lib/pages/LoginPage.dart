import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Neon Citizens",
          style: TextStyle(color: Colors.blueAccent),
        ),
        backgroundColor: Colors.yellowAccent,
      ),
      backgroundColor: Colors.yellow,
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
                        onPressed: () {
                          print("Here");
                        },
                      ))
                ],
              ))),
    );
  }
}
