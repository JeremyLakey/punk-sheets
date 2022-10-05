import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:neon/pages/OverviewPage.dart';
import 'package:neon/pages/LoginPage.dart';
import 'package:neon/pages/HealthPage.dart';
import 'package:neon/pages/SkillsPage.dart';
import 'package:neon/pages/WeaponsPage.dart';
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
          leading: const Icon(Icons.face_outlined),
          title: Text("Overview"),
          onTap: () {
            GoRouter.of(context).go('/overview');
          },
        ),
        ListTile(
          leading: const Icon(Icons.school),
          title: Text("Skills"),
          onTap: () {
            GoRouter.of(context).go('/skill');
          },
        ),
        ListTile(
          leading: const Icon(Icons.military_tech),
          title: Text("Weapons"),
          onTap: () {
            GoRouter.of(context).go('/weapon');
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border_outlined),
          title: Text("Health and Armor"),
          onTap: () {
            GoRouter.of(context).go('/health');
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
