import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:neon/pages/CharacterPage.dart';
import 'package:neon/pages/LoginPage.dart';
import 'package:neon/pages/characterTabs/HealthPage.dart';
import 'package:neon/pages/characterTabs/SkillsPage.dart';
import 'package:neon/pages/characterTabs/WeaponsPage.dart';
import 'package:neon/pages/SelectPage.dart';

class NavPanel extends StatelessWidget {
  const NavPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[buildHeader(context), buildMenuItems(context)],
      ),
    ));
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.close),
          title: Text("Close"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.group),
          title: Text("Change Character"),
          onTap: () {
            GoRouter.of(context).go('/select');
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: Text("Log out"),
          onTap: () {
            GoRouter.of(context).go('/');
          },
        ),
      ],
    );
  }
}
