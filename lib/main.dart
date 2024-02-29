import 'package:flutter/material.dart';
import 'package:movil_project/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RuralMarketExpress',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime.shade50),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
