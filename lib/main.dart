import 'package:flutter/material.dart';
import 'widgets/member3_nav_shell.dart';

void main() {
  runApp(const SafetyApplication());
}

class SafetyApplication extends StatelessWidget {
  const SafetyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safety & Tracking System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F19),
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const SafetyNavigationShell(),
    );
  }
}
