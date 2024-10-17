import 'package:calculator/features/calculation/domain/entities/result.dart';
import 'package:calculator/features/calculation/domain/repository/calculation_repository.dart';

/// A use case class responsible for handling addition operations.
class AddUseCase {
  final CalculationRepository repository;

  /// Constructor for [AddUseCase], which requires a [repository] to perform the addition operation.
  AddUseCase({required this.repository});

  /// Executes the addition operation by calling the repository's [add] method.
  ///
  /// Takes two numbers, [num1] and [num2], and returns a [Future] containing the [Result] of the addition.
  Future<Result> call(double num1, double num2) async {
    return await repository.add(num1, num2);
  }
}
