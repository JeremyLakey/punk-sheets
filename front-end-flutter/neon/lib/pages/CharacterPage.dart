import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/pages/characterTabs/HealthPage.dart';
import 'package:neon/pages/characterTabs/OverviewPage.dart';
import 'package:neon/pages/characterTabs/SkillsPage.dart';
import 'package:neon/pages/characterTabs/WeaponsPage.dart';

import 'package:neon/style/style.dart';
import 'package:neon/widgets/navigationSidePanel.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPage();
}

class _CharacterPage extends State<CharacterPage> {
  static double _fontSize = 30;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: NavPanel(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: NeonStyles.fontColor),
            backgroundColor: NeonStyles.primaryColor,
            title: Text(
              "OverView",
              style: TextStyle(color: NeonStyles.fontColor),
            ),
            bottom: TabBar(tabs: [
              Tab(
                  icon: Icon(
                Icons.face_outlined,
                color: NeonStyles.fontColor,
                size: _fontSize,
              )),
              Tab(
                  icon: Icon(
                Icons.favorite_border_outlined,
                color: NeonStyles.fontColor,
                size: _fontSize,
              )),
              Tab(
                  icon: Icon(
                Icons.casino,
                color: NeonStyles.fontColor,
                size: _fontSize,
              )),
              Tab(
                  icon: Icon(
                Icons.plumbing,
                color: NeonStyles.fontColor,
                size: _fontSize,
              )),
            ]),
          ),
          body: TabBarView(children: [
            OverviewPage(),
            HealthPage(),
            SkillPage(),
            WeaponPage()
          ]),
        ));
  }
}
