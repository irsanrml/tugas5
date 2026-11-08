import 'package:flutter/material.dart';
import 'package:tugas5/pages/login.dart';
import 'package:tugas5/pages/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: AppThemes.light,
      home: LoginPage(),
    );
  }
}
