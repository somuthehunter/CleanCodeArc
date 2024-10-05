import 'package:calculator/features/calculation/domain/entities/result.dart';
import 'package:calculator/features/calculation/domain/repository/calculation_repository.dart';

class AddUseCase {
  final CalculationRepository repository;
  AddUseCase({required this.repository});
  Future<Result> call(double num1, double num2) async {
    return await repository.add(num1, num2);
  }
}
