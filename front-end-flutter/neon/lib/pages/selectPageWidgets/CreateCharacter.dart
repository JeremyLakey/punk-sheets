import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:neon/style/style.dart';

class CreateCharacter extends StatefulWidget {
  @override
  State<CreateCharacter> createState() => _CreateCharacter();
}

class _CreateCharacter extends State<CreateCharacter> {
  int intValue = 2;
  int refValue = 2;
  int coolValue = 2;
  int maValue = 2;
  int techValue = 2;
  int attrValue = 2;
  int luckValue = 2;
  int bodyValue = 2;
  int empValue = 2;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Create Character",
            style: TextStyle(color: NeonStyles.fontColor),
          ),
          iconTheme: IconThemeData(color: NeonStyles.fontColor),
          backgroundColor: NeonStyles.secondaryColor,
          leading: IconButton(
              onPressed: () {
                print("go back");
                GoRouter.of(context).go('/select');
              },
              icon: const Icon(Icons.arrow_back))),
      body: Container(
        width: screenWidth,
        color: NeonStyles.primaryColor,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "name"),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * .42),
              child: Row(
                children: [
                  Center(
                      child: Row(
                    children: [
                      Text("Int"),
                      SizedBox(
                        width: 8,
                      ),
                      DropdownButton(
                          value: intValue,
                          items: [
                            DropdownMenuItem(child: Text("2"), value: 2),
                            DropdownMenuItem(child: Text("3"), value: 3),
                            DropdownMenuItem(child: Text("4"), value: 4),
                            DropdownMenuItem(child: Text("5"), value: 5),
                            DropdownMenuItem(child: Text("6"), value: 6),
                            DropdownMenuItem(child: Text("7"), value: 7),
                            DropdownMenuItem(child: Text("8"), value: 8),
                            DropdownMenuItem(child: Text("9"), value: 9),
                            DropdownMenuItem(child: Text("10"), value: 10),
                          ],
                          onChanged: (value) {
                            if (value == null) return;
                            print(value);
                            intValue = value;
                            setState(() {});
                          }),
                    ],
                  )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Row(
                        children: [
                          Text("Ref"),
                          SizedBox(
                            width: 8,
                          ),
                          DropdownButton(
                              value: refValue,
                              items: [
                                DropdownMenuItem(child: Text("2"), value: 2),
                                DropdownMenuItem(child: Text("3"), value: 3),
                                DropdownMenuItem(child: Text("4"), value: 4),
                                DropdownMenuItem(child: Text("5"), value: 5),
                                DropdownMenuItem(child: Text("6"), value: 6),
                                DropdownMenuItem(child: Text("7"), value: 7),
                                DropdownMenuItem(child: Text("8"), value: 8),
                                DropdownMenuItem(child: Text("9"), value: 9),
                                DropdownMenuItem(child: Text("10"), value: 10),
                              ],
                              onChanged: (value) {
                                if (value == null) return;
                                print(value);
                                refValue = value;
                                setState(() {});
                              }),
                        ],
                      ))),
                  Center(
                      child: Row(
                    children: [
                      Text("Tech"),
                      SizedBox(
                        width: 8,
                      ),
                      DropdownButton(
                          value: techValue,
                          items: [
                            DropdownMenuItem(child: Text("2"), value: 2),
                            DropdownMenuItem(child: Text("3"), value: 3),
                            DropdownMenuItem(child: Text("4"), value: 4),
                            DropdownMenuItem(child: Text("5"), value: 5),
                            DropdownMenuItem(child: Text("6"), value: 6),
                            DropdownMenuItem(child: Text("7"), value: 7),
                            DropdownMenuItem(child: Text("8"), value: 8),
                            DropdownMenuItem(child: Text("9"), value: 9),
                            DropdownMenuItem(child: Text("10"), value: 10),
                          ],
                          onChanged: (value) {
                            if (value == null) return;
                            print(value);
                            techValue = value;
                            setState(() {});
                          }),
                    ],
                  )),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth * .42),
                child: Row(children: [
                  Row(
                    children: [
                      Text("Cool"),
                      SizedBox(
                        width: 8,
                      ),
                      DropdownButton(
                          value: coolValue,
                          items: [
                            DropdownMenuItem(child: Text("2"), value: 2),
                            DropdownMenuItem(child: Text("3"), value: 3),
                            DropdownMenuItem(child: Text("4"), value: 4),
                            DropdownMenuItem(child: Text("5"), value: 5),
                            DropdownMenuItem(child: Text("6"), value: 6),
                            DropdownMenuItem(child: Text("7"), value: 7),
                            DropdownMenuItem(child: Text("8"), value: 8),
                            DropdownMenuItem(child: Text("9"), value: 9),
                            DropdownMenuItem(child: Text("10"), value: 10),
                          ],
                          onChanged: (value) {
                            if (value == null) return;
                            print(value);
                            coolValue = value;
                            setState(() {});
                          }),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text("Ma"),
                          SizedBox(
                            width: 8,
                          ),
                          DropdownButton(
                              value: attrValue,
                              items: [
                                DropdownMenuItem(child: Text("2"), value: 2),
                                DropdownMenuItem(child: Text("3"), value: 3),
                                DropdownMenuItem(child: Text("4"), value: 4),
                                DropdownMenuItem(child: Text("5"), value: 5),
                                DropdownMenuItem(child: Text("6"), value: 6),
                                DropdownMenuItem(child: Text("7"), value: 7),
                                DropdownMenuItem(child: Text("8"), value: 8),
                                DropdownMenuItem(child: Text("9"), value: 9),
                                DropdownMenuItem(child: Text("10"), value: 10),
                              ],
                              onChanged: (value) {
                                if (value == null) return;
                                print(value);
                                attrValue = value;
                                setState(() {});
                              }),
                        ],
                      )),
                  Row(
                    children: [
                      Text("Luck"),
                      SizedBox(
                        width: 8,
                      ),
                      DropdownButton(
                          value: luckValue,
                          items: [
                            DropdownMenuItem(child: Text("2"), value: 2),
                            DropdownMenuItem(child: Text("3"), value: 3),
                            DropdownMenuItem(child: Text("4"), value: 4),
                            DropdownMenuItem(child: Text("5"), value: 5),
                            DropdownMenuItem(child: Text("6"), value: 6),
                            DropdownMenuItem(child: Text("7"), value: 7),
                            DropdownMenuItem(child: Text("8"), value: 8),
                            DropdownMenuItem(child: Text("9"), value: 9),
                            DropdownMenuItem(child: Text("10"), value: 10),
                          ],
                          onChanged: (value) {
                            if (value == null) return;
                            print(value);
                            luckValue = value;
                            setState(() {});
                          }),
                    ],
                  ),
                ])),
            Padding(
                padding: EdgeInsets.only(left: screenWidth * .42),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text("Ma"),
                        SizedBox(
                          width: 8,
                        ),
                        DropdownButton(
                            value: maValue,
                            items: [
                              DropdownMenuItem(child: Text("2"), value: 2),
                              DropdownMenuItem(child: Text("3"), value: 3),
                              DropdownMenuItem(child: Text("4"), value: 4),
                              DropdownMenuItem(child: Text("5"), value: 5),
                              DropdownMenuItem(child: Text("6"), value: 6),
                              DropdownMenuItem(child: Text("7"), value: 7),
                              DropdownMenuItem(child: Text("8"), value: 8),
                              DropdownMenuItem(child: Text("9"), value: 9),
                              DropdownMenuItem(child: Text("10"), value: 10),
                            ],
                            onChanged: (value) {
                              if (value == null) return;
                              print(value);
                              maValue = value;
                              setState(() {});
                            }),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text("Body"),
                            SizedBox(
                              width: 8,
                            ),
                            DropdownButton(
                                value: bodyValue,
                                items: [
                                  DropdownMenuItem(child: Text("2"), value: 2),
                                  DropdownMenuItem(child: Text("3"), value: 3),
                                  DropdownMenuItem(child: Text("4"), value: 4),
                                  DropdownMenuItem(child: Text("5"), value: 5),
                                  DropdownMenuItem(child: Text("6"), value: 6),
                                  DropdownMenuItem(child: Text("7"), value: 7),
                                  DropdownMenuItem(child: Text("8"), value: 8),
                                  DropdownMenuItem(child: Text("9"), value: 9),
                                  DropdownMenuItem(
                                      child: Text("10"), value: 10),
                                ],
                                onChanged: (value) {
                                  if (value == null) return;
                                  print(value);
                                  bodyValue = value;
                                  setState(() {});
                                }),
                          ],
                        )),
                    Row(
                      children: [
                        Text("Emp"),
                        SizedBox(
                          width: 8,
                        ),
                        DropdownButton(
                            value: empValue,
                            items: [
                              DropdownMenuItem(child: Text("2"), value: 2),
                              DropdownMenuItem(child: Text("3"), value: 3),
                              DropdownMenuItem(child: Text("4"), value: 4),
                              DropdownMenuItem(child: Text("5"), value: 5),
                              DropdownMenuItem(child: Text("6"), value: 6),
                              DropdownMenuItem(child: Text("7"), value: 7),
                              DropdownMenuItem(child: Text("8"), value: 8),
                              DropdownMenuItem(child: Text("9"), value: 9),
                              DropdownMenuItem(child: Text("10"), value: 10),
                            ],
                            onChanged: (value) {
                              if (value == null) return;
                              print(value);
                              empValue = value;
                              setState(() {});
                            }),
                      ],
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextButton(
                  child: Text("Finish", style: TextStyle(fontSize: 20)),
                  onPressed: () async {
                    print("Submit");

                    await FlutterPlatformAlert.playAlertSound();
                    GoRouter.of(context).go('/overview');
                  },
                )),
          ],
        ),
      ),
    );
  }
}
