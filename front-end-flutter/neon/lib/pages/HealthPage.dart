import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:neon/style/style.dart';
import 'package:neon/widgets/navigationSidePanel.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPage();
}

class _HealthPage extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: NavPanel(),
      appBar: AppBar(
        title: Text(
          "Health",
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
