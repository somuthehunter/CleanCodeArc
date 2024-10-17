import 'package:calculator/features/calculation/domain/entities/result.dart';

/// An abstract class representing the contract for a calculation repository.
///
/// This repository defines methods for performing basic arithmetic operations:
/// addition, subtraction, multiplication, and division.
abstract class CalculationRepository {
  /// Adds two numbers and returns the result.
  ///
  /// Takes [num1] and [num2] as parameters and returns a [Future] containing a [Result].
  Future<Result> add(double num1, double num2);

  /// Subtracts the second number from the first and returns the result.
  ///
  /// Takes [num1] and [num2] as parameters and returns a [Future] containing a [Result].
  Future<Result> subtract(double num1, double num2);

  /// Multiplies two numbers and returns the result.
  ///
  /// Takes [num1] and [num2] as parameters and returns a [Future] containing a [Result].
  Future<Result> multiply(double num1, double num2);

  /// Divides the first number by the second and returns the result.
  ///
  /// Takes [num1] and [num2] as parameters and returns a [Future] containing a [Result].
  Future<Result> divide(double num1, double num2);
}
