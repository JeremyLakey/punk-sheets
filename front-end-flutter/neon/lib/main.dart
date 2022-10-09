import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import 'package:neon/pages/CharacterPage.dart';
import 'package:neon/pages/LoginPage.dart';
import 'package:neon/pages/characterTabs/HealthPage.dart';
import 'package:neon/pages/characterTabs/SkillsPage.dart';
import 'package:neon/pages/characterTabs/WeaponsPage.dart';
import 'package:neon/pages/SelectPage.dart';

final getIt = GetIt.instance;

void main() {
  runApp(NeonCitizensApp());
}

class NeonCitizensApp extends StatelessWidget {
  NeonCitizensApp({super.key});

  final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(
        path: '/overview', builder: (context, state) => const CharacterPage()),
    GoRoute(path: '/select', builder: (context, state) => const SelectPage()),
  ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}
