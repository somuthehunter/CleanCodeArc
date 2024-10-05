import 'package:calculator/features/calculation/domain/entities/result.dart';
import 'package:calculator/features/calculation/domain/repository/calculation_repository.dart';

class SubtractUseCase {
  final CalculationRepository repository;
  SubtractUseCase({required this.repository});
  Future<Result> call(double num1, double num2) async {
    return await repository.subtract(num1, num2);
  }
}
