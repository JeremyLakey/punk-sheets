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
    return Container(child: Text("Health Page"));
  }
}
