import 'package:calculator/features/calculation/domain/entities/result.dart';
import 'package:calculator/features/calculation/domain/repository/calculation_repository.dart';

/// A use case class responsible for handling division operations.
class DivideUseCase {
  final CalculationRepository repository;

  /// Constructor for [DivideUseCase], which requires a [repository] to perform the division operation.
  DivideUseCase({required this.repository});

  /// Executes the division operation by calling the repository's [divide] method.
  ///
  /// Takes two numbers, [num1] and [num2], and returns a [Future] containing the [Result] of the division.
  Future<Result> call(double num1, double num2) async {
    return await repository.divide(num1, num2);
  }
}
