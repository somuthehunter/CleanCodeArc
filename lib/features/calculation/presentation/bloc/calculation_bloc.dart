import 'package:calculator/features/calculation/domain/entities/result.dart';
import 'package:calculator/features/calculation/domain/usecases/add_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/div_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/mul_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/subtract_use_case.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calculation_event.dart';
part 'calculation_state.dart';

/// Bloc responsible for handling arithmetic calculations including addition,
/// subtraction, multiplication, and division. It uses respective use cases to
/// perform operations and emits states based on the result.
///
/// The Bloc listens to different calculation events such as `AdditionEvent`,
/// `SubtractionEvent`, `MultiplicationEvent`, and `DivisionEvent` and responds
/// by emitting the respective result or error state.

class CalculationBloc extends Bloc<CalculationEvent, CalculationState> {
  final AddUseCase addUseCase;
  final SubtractUseCase subtractUseCase;
  final MultiplyUseCase multiplyUseCase;
  final DivideUseCase divideUseCase;

  /// Constructor requires instances of use cases for addition, subtraction,
  /// multiplication, and division to perform the respective calculations.
  ///
  /// [addUseCase] handles addition,
  /// [subtractUseCase] handles subtraction,
  /// [multiplyUseCase] handles multiplication, and
  /// [divideUseCase] handles division operations.
  CalculationBloc({
    required this.addUseCase,
    required this.subtractUseCase,
    required this.multiplyUseCase,
    required this.divideUseCase,
  }) : super(CalculationInitial()) {
    // Handles addition event and emits the result.
    on<AdditionEvent>((event, emit) async {
      final Result res = await addUseCase(event.num1, event.num2);
      emit(AdditionResult(result: res));
    });

    // Handles subtraction event and emits the result.
    on<SubtractionEvent>((event, emit) async {
      final Result subRes = await subtractUseCase(event.num1, event.num2);
      emit(SubtractionResult(result: subRes));
    });

    // Handles multiplication event and emits the result.
    on<MultiplicationEvent>((event, emit) async {
      final Result mulRes = await multiplyUseCase(event.num1, event.num2);
      emit(MultiplicationResult(result: mulRes));
    });

    // Handles division event, checks for division by zero, and emits the result or an error.
    on<DivisionEvent>((event, emit) async {
      if (event.num2 == 0) {
        emit(DivisionError(divisionErrorMessage: 'Infinity'));
        return;
      }
      final Result divRes = await divideUseCase(event.num1, event.num2);
      emit(DivisionResult(result: divRes));
    });
  }
}
