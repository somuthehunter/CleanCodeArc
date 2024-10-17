part of 'calculation_bloc.dart';

/// Base class for all calculation events, representing operations with two numbers.
/// It holds two numeric values, [num1] and [num2], which will be used for arithmetic operations.
@immutable
abstract class CalculationEvent {
  final double num1;
  final double num2;

  /// Constructor for [CalculationEvent] requires two numbers [num1] and [num2]
  /// that represent the input for any arithmetic operation.
  const CalculationEvent({required this.num1, required this.num2});
}

/// Event class for addition operations. Inherits from [CalculationEvent].
/// Triggers the addition of [num1] and [num2].
class AdditionEvent extends CalculationEvent {
  /// Constructor for [AdditionEvent], takes in [num1] and [num2].
  const AdditionEvent({required super.num1, required super.num2});
}

/// Event class for subtraction operations. Inherits from [CalculationEvent].
/// Triggers the subtraction of [num2] from [num1].
class SubtractionEvent extends CalculationEvent {
  /// Constructor for [SubtractionEvent], takes in [num1] and [num2].
  const SubtractionEvent({required super.num1, required super.num2});
}

/// Event class for multiplication operations. Inherits from [CalculationEvent].
/// Triggers the multiplication of [num1] and [num2].
class MultiplicationEvent extends CalculationEvent {
  /// Constructor for [MultiplicationEvent], takes in [num1] and [num2].
  const MultiplicationEvent({required super.num1, required super.num2});
}

/// Event class for division operations. Inherits from [CalculationEvent].
/// Triggers the division of [num1] by [num2].
///
/// If [num2] is zero, division by zero should be handled appropriately by emitting an error state.
class DivisionEvent extends CalculationEvent {
  /// Constructor for [DivisionEvent], takes in [num1] and [num2].
  const DivisionEvent({required super.num1, required super.num2});
}
