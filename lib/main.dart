import 'package:calculator/core/service_locator.dart';
import 'package:calculator/features/calculation/presentation/pages/calculation_homescreens.dart';
// import 'package:calculator/features/home/ui/calculation_screen.dart'; // Uncomment if needed
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await init(); // Awaiting async initialization
    runApp(const MyApp());
  } catch (e, stacktrace) {
    print('Error during initialization: $e');
    print('Stacktrace: $stacktrace');
  }
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
