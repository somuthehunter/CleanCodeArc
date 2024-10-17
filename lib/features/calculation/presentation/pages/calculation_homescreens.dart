import 'package:calculator/core/service_locator.dart';
import 'package:calculator/features/calculation/presentation/bloc/calculation_bloc.dart';
import 'package:calculator/features/calculation/domain/usecases/add_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/subtract_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/mul_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/div_use_case.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  //For Addition controller which manages the input of the input fields
  final TextEditingController _num1Add = TextEditingController();
  final TextEditingController _num2Add = TextEditingController();
  //This is for the managing the result of the addition
  final TextEditingController _addRes = TextEditingController();
//For subtraction Controller
  final TextEditingController _num1Sub = TextEditingController();
  final TextEditingController _num2Sub = TextEditingController();
  //This is for the managing the result of the subtraction
  final TextEditingController _subRes = TextEditingController();
  //for Multiplication
  final TextEditingController _num1Mul = TextEditingController();
  final TextEditingController _num2Mul = TextEditingController();
  //This is for the managing the result of the multiplication
  final TextEditingController _mulRes = TextEditingController();
  //For Division
  final TextEditingController _num1Div = TextEditingController();
  final TextEditingController _num2Div = TextEditingController();
  //This is for the managing the result of the division
  final TextEditingController _divRes = TextEditingController();


  /// A helper method to build a custom TextField widget for numerical input.
  /// It allows customization for making the field read-only and handling value changes.
  ///
  /// This widget will be displayed inside a `SizedBox` that takes up a fraction
  /// of the screen's width to ensure consistent layout across various devices.
  ///
  /// [controller] is the TextEditingController responsible for managing the
  /// input and updating the associated text field.
  /// [readOnly] is an optional boolean parameter indicating if the field should be
  /// read-only (default is `false`).
  /// [onChanged] is an optional callback function that will be triggered whenever
  /// the value of the text field changes.
  ///
  /// Example Usage:
  /// ```dart
  /// _buildTextField(
  ///   controller: _num1Add,
  ///   readOnly: true,  // Makes the field read-only
  ///   onChanged: (value) {
  ///     // Logic to handle value change
  ///   }
  /// );
  /// ```

  Widget _buildTextField(
          {required TextEditingController? controller,
          bool readOnly = false,
          void Function(String)? onChanged}) =>
      SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        child: TextField(
          readOnly: readOnly,
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          onChanged: onChanged,
        ),
      );


      //This helps to perform addition calculation take the inputs and triggers the Bloc & Addition Event

  void _addditionCalulation({required BuildContext context}) {
    double num1 = _num1Add.text.isEmpty ? 0 : double.parse(_num1Add.text);
    double num2 = _num2Add.text.isEmpty ? 0 : double.parse(_num2Add.text);

    context.read<CalculationBloc>().add(AdditionEvent(num1: num1, num2: num2));
  }
//this helps to perform the subtraction Event , and trigger the Bloc & SubtractionEvent
  void _subtractionCalculation({required BuildContext context}) {
    double sub1 = _num1Sub.text.isEmpty ? 0 : double.parse(_num1Sub.text);
    double sub2 = _num2Sub.text.isEmpty ? 0 : double.parse(_num2Sub.text);

    context
        .read<CalculationBloc>()
        .add(SubtractionEvent(num1: sub1, num2: sub2));
  }
  //this helps to perform the Multiplication Event , and trigger the Bloc & MultiplicationEvent

  void _multiplicationCalculation({required BuildContext context}) {
    double mul1 = _num1Mul.text.isEmpty ? 0 : double.parse(_num1Mul.text);
    double mul2 = _num2Mul.text.isEmpty ? 0 : double.parse(_num2Mul.text);

    context
        .read<CalculationBloc>()
        .add(MultiplicationEvent(num1: mul1, num2: mul2));
  }
//this helps to perform the Division Event , and trigger the Bloc & DivisionEvent
  void _divisionCalculation({required BuildContext context}) {
    double div1 = _num1Div.text.isEmpty ? 0 : double.parse(_num1Div.text);
    double div2 = _num2Div.text.isEmpty ? 0 : double.parse(_num2Div.text);

    context.read<CalculationBloc>().add(DivisionEvent(num1: div1, num2: div2));
  }


//Deallocating the memory of the variable using dispose function 
  @override
  void dispose() {
    _num1Add.dispose();
    _num2Add.dispose();
    _addRes.dispose();
    _num1Sub.dispose();
    _num2Sub.dispose();
    _subRes.dispose();
    _num1Mul.dispose();
    _num2Mul.dispose();
    _mulRes.dispose();
    _num1Div.dispose();
    _num2Div.dispose();
    _divRes.dispose();
    super.dispose();
  }


//This is the widgets , which builds the calculation homescreen and also the Dependency injection
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(child: Text('Calculator')),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocProvider(
              create: (context) => CalculationBloc(
                addUseCase: sl<AddUseCase>(),
                subtractUseCase: sl<SubtractUseCase>(),
                multiplyUseCase: sl<MultiplyUseCase>(),
                divideUseCase: sl<DivideUseCase>(),
              ),
              child: BlocListener<CalculationBloc, CalculationState>(
                listener: (context, state) {
                  switch (state) {
                    case CalculationLoading _:
                      break;
                    case AdditionResult _:
                      _addRes.text = state.result.answer.toString();
                      break;
                    case SubtractionResult _:
                      _subRes.text = state.result.answer.toString();
                      break;
                    case MultiplicationResult _:
                      _mulRes.text = state.result.answer.toString();
                      break;
                    case DivisionResult _:
                      _divRes.text = state.result.answer.toString();
                      break;
                    case DivisionError _:
                      _divRes.text = state.divisionErrorMessage;
                    default:
                      print("Encountered state: $state");
                  }
                },
                child: Builder(builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First row for addition
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildTextField(
                              controller: _num1Add,
                              onChanged: (_) =>
                                  _addditionCalulation(context: context)),
                          const Text('+'),
                          _buildTextField(
                              controller: _num2Add,
                              onChanged: (_) =>
                                  _addditionCalulation(context: context)),
                          const Text('='),
                          _buildTextField(controller: _addRes, readOnly: true),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildTextField(
                              controller: _num1Sub,
                              onChanged: (_) =>
                                  _subtractionCalculation(context: context)),
                          const Text('-'),
                          _buildTextField(
                              controller: _num2Sub,
                              onChanged: (_) =>
                                  _subtractionCalculation(context: context)),
                          const Text('='),
                          _buildTextField(controller: _subRes, readOnly: true),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildTextField(
                            controller: _num1Mul,
                            onChanged: (_) =>
                                _multiplicationCalculation(context: context),
                          ),
                          const Text('*'),
                          _buildTextField(
                            controller: _num2Mul,
                            onChanged: (_) =>
                                _multiplicationCalculation(context: context),
                          ),
                          const Text('='),
                          _buildTextField(
                            controller: _mulRes,
                            onChanged: (_) =>
                                _multiplicationCalculation(context: context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildTextField(
                            controller: _num1Div,
                            onChanged: (_) =>
                                _divisionCalculation(context: context),
                          ),
                          const Text('/'),
                          _buildTextField(
                              controller: _num2Div,
                              onChanged: (_) =>
                                  _divisionCalculation(context: context)),
                          const Text('='),
                          _buildTextField(controller: _divRes, readOnly: true),
                        ],
                      )
                    ],
                  );
                }),
              ),
            )));
  }
}
