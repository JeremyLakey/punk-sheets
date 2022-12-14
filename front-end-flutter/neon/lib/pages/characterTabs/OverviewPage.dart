import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:neon/style/style.dart';
import 'package:neon/widgets/navigationSidePanel.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPage();
}

class _OverviewPage extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Text("Overview Page"),
      color: NeonStyles.primaryColor,
    );
  }
}
