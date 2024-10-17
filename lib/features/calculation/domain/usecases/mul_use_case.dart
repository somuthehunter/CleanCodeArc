import 'package:calculator/features/calculation/domain/entities/result.dart';
import 'package:calculator/features/calculation/domain/repository/calculation_repository.dart';

/// A use case class responsible for handling multiplication operations.
class MultiplyUseCase {
  final CalculationRepository repository;

  /// Constructor for [MultiplyUseCase], which requires a [repository] to perform the multiplication operation.
  MultiplyUseCase({required this.repository});

  /// Executes the multiplication operation by calling the repository's [multiply] method.
  ///
  /// Takes two numbers, [num1] and [num2], and returns a [Future] containing the [Result] of the multiplication.
  Future<Result> call(double num1, double num2) async {
    return await repository.multiply(num1, num2);
  }
}
