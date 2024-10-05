import 'package:calculator/core/service_locator.dart';
import 'package:calculator/features/calculation/presentation/pages/calculation_homescreens.dart';
// import 'package:calculator/features/home/ui/calculation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculationScreen(),
    );
  }
}
