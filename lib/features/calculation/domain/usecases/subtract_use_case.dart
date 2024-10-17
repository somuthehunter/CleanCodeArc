import 'package:calculator/features/calculation/domain/entities/result.dart';
import 'package:calculator/features/calculation/domain/repository/calculation_repository.dart';

/// A use case class responsible for handling subtraction operations.
class SubtractUseCase {
  final CalculationRepository repository;

  /// Constructor for [SubtractUseCase], which requires a [repository] to perform the subtraction operation.
  SubtractUseCase({required this.repository});

  /// Executes the subtraction operation by calling the repository's [subtract] method.
  ///
  /// Takes two numbers, [num1] and [num2], and returns a [Future] containing the [Result] of the subtraction.
  Future<Result> call(double num1, double num2) async {
    return await repository.subtract(num1, num2);
  }
}
