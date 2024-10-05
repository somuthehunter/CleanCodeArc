part of 'calculation_bloc.dart';

// Addition events
@immutable
abstract class CalculationEvent {
  final double num1;
  final double num2;

  const CalculationEvent({required this.num1, required this.num2});
}

class AdditionEvent extends CalculationEvent {
  const AdditionEvent({required super.num1, required super.num2});
}

class SubtractionEvent extends CalculationEvent {
  const SubtractionEvent({required super.num1, required super.num2});
}

class MultiplicationEvent extends CalculationEvent {
  const MultiplicationEvent({required super.num1, required super.num2});
}

class DivisionEvent extends CalculationEvent {
  const DivisionEvent({required super.num1, required super.num2});
}
