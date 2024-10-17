/// A class representing a calculation entity.
///
/// This class encapsulates two numbers used in arithmetic operations.
class CalculationEntity {
  /// The first number in the calculation.
  final double num1;

  /// The second number in the calculation.
  final double num2;

  /// Creates a [CalculationEntity] instance with the given [num1] and [num2].
  ///
  /// Both [num1] and [num2] parameters are required and must be provided
  /// when creating a [CalculationEntity] object.
  CalculationEntity({required this.num1, required this.num2});
}
