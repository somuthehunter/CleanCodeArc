part of 'calculation_bloc.dart';

// General state
@immutable
abstract class CalculationState {}

class CalculationInitial extends CalculationState {}

class CalculationLoading extends CalculationState {}

// Addition result state
class AdditionResult extends CalculationState {
  final Result result;
  AdditionResult({required this.result});
}

class AdditionError extends CalculationState {}

// Subtraction result state
class SubtractionResult extends CalculationState {
  final Result result;
  SubtractionResult({required this.result});
}

class SubtractionError extends CalculationState {
  final String subtractErrorMessage;
  SubtractionError({required this.subtractErrorMessage});
}

// Multiplication result state
class MultiplicationResult extends CalculationState {
  final Result result;
  MultiplicationResult({required this.result});
}

class MultiplicationError extends CalculationState {}

// Division result state
class DivisionResult extends CalculationState {
  final Result result;
  DivisionResult({required this.result});
}

class DivisionError extends CalculationState {
  final String divisionErrorMessage;
  DivisionError({required this.divisionErrorMessage});
}
