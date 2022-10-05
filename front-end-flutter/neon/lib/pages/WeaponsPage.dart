import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:neon/style/style.dart';
import 'package:neon/widgets/navigationSidePanel.dart';

class WeaponPage extends StatefulWidget {
  const WeaponPage({super.key});

  @override
  State<WeaponPage> createState() => _WeaponPage();
}

class _WeaponPage extends State<WeaponPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: NavPanel(),
      appBar: AppBar(
        title: Text(
          "Overview Page",
          style: TextStyle(color: NeonStyles.fontColor),
        ),
        backgroundColor: NeonStyles.secondaryColor,
        iconTheme: IconThemeData(color: NeonStyles.fontColor),
      ),
      backgroundColor: NeonStyles.primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("hi");
        },
      ),
    );
  }
}
