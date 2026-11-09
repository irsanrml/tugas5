import 'package:flutter/material.dart';
import 'package:tugas5/pages/themes.dart';
import 'package:tugas5/pages/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      home: LoginPage(),
    );
  }
}
