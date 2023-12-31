import 'package:flutter/material.dart';
import 'package:limawaktu/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LimaWaktu',
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const GettingStartedScreen(),
    );
  }
}
