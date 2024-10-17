part of 'calculation_bloc.dart';

/// Base class representing the various states in the calculation process.
@immutable
abstract class CalculationState {}

/// Initial state before any calculation has been performed.
class CalculationInitial extends CalculationState {}

/// State representing a loading phase during a calculation.
class CalculationLoading extends CalculationState {}

/// State representing the successful result of an addition operation.
class AdditionResult extends CalculationState {
  final Result result;

  /// Constructor for [AdditionResult], which takes a [result] containing the outcome of the addition.
  AdditionResult({required this.result});
}

/// State representing an error encountered during an addition operation.
class AdditionError extends CalculationState {}

/// State representing the successful result of a subtraction operation.
class SubtractionResult extends CalculationState {
  final Result result;

  /// Constructor for [SubtractionResult], which takes a [result] containing the outcome of the subtraction.
  SubtractionResult({required this.result});
}

/// State representing an error encountered during a subtraction operation.
/// Contains an error message describing the issue.
class SubtractionError extends CalculationState {
  final String subtractErrorMessage;

  /// Constructor for [SubtractionError], requires a [subtractErrorMessage] describing the error.
  SubtractionError({required this.subtractErrorMessage});
}

/// State representing the successful result of a multiplication operation.
class MultiplicationResult extends CalculationState {
  final Result result;

  /// Constructor for [MultiplicationResult], which takes a [result] containing the outcome of the multiplication.
  MultiplicationResult({required this.result});
}

/// State representing an error encountered during a multiplication operation.
class MultiplicationError extends CalculationState {}

/// State representing the successful result of a division operation.
class DivisionResult extends CalculationState {
  final Result result;

  /// Constructor for [DivisionResult], which takes a [result] containing the outcome of the division.
  DivisionResult({required this.result});
}

/// State representing an error encountered during a division operation.
/// Contains an error message indicating the issue (such as division by zero).
class DivisionError extends CalculationState {
  final String divisionErrorMessage;

  /// Constructor for [DivisionError], requires a [divisionErrorMessage] describing the error.
  DivisionError({required this.divisionErrorMessage});
}
