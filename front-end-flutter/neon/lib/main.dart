import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/pages/OverviewPage.dart';
import 'package:neon/pages/LoginPage.dart';
import 'package:neon/pages/HealthPage.dart';
import 'package:neon/pages/SkillsPage.dart';
import 'package:neon/pages/WeaponsPage.dart';
import 'package:neon/pages/SelectPage.dart';

void main() {
  runApp(NeonCitizensApp());
}

class NeonCitizensApp extends StatelessWidget {
  NeonCitizensApp({super.key});

  final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(
        path: '/overview', builder: (context, state) => const OverviewPage()),
    GoRoute(path: '/weapon', builder: (contest, state) => const WeaponPage()),
    GoRoute(path: '/health', builder: (context, state) => const HealthPage()),
    GoRoute(path: '/skill', builder: ((context, state) => const SkillPage())),
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
