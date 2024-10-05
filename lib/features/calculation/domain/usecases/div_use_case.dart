import 'package:calculator/features/calculation/domain/entities/result.dart';
import 'package:calculator/features/calculation/domain/repository/calculation_repository.dart';

class DivideUseCase {
  final CalculationRepository repository;
  DivideUseCase({required this.repository});
  Future<Result> call(double num1, double num2) async {
    return await repository.divide(num1, num2);
  }
}
