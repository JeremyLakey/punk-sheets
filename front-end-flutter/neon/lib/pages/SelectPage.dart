import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:neon/style/style.dart';
import 'package:neon/widgets/navigationSidePanel.dart';

// The page where users can select a character sheet;

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPage();
}

class _SelectPage extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: NavPanel(),
      appBar: AppBar(
        title: Text(
          "Select Character Sheet",
          style: TextStyle(color: NeonStyles.fontColor),
        ),
        backgroundColor: NeonStyles.secondaryColor,
        iconTheme: IconThemeData(color: NeonStyles.fontColor),
      ),
      backgroundColor: NeonStyles.primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("implement create character sheet");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
