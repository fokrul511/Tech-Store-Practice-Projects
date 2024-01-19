import 'package:flutter/material.dart';
import 'package:tech_store/view/screen/desh_bord.dart';
import 'package:tech_store/view/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DeshBordScreen(),
    );
  }
}
