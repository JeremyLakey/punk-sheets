import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:neon/style/style.dart';
import 'package:neon/widgets/navigationSidePanel.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPage();
}

class _SkillPage extends State<SkillPage> {
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
