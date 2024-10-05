import 'package:calculator/features/calculation/data/data%20sources/remote/calculation_data_source.dart';
import 'package:calculator/features/calculation/domain/entities/result.dart';
import 'package:calculator/features/calculation/domain/repository/calculation_repository.dart';

class CalculationRepositoryImpl implements CalculationRepository {
  final CalculationDataSource calculationDataSource;

  CalculationRepositoryImpl({required this.calculationDataSource});

  @override
  Future<Result> add(double num1, double num2) async {
    final addRes = await calculationDataSource.add(num1: num1, num2: num2);
    return addRes.toEntity();
  }

  @override
  Future<Result> subtract(double num1, double num2) async {
    final subRes = await calculationDataSource.subtract(num1: num1, num2: num2);
    return subRes.toEntity();
  }

  @override
  Future<Result> multiply(double num1, double num2) async {
    final mulRes = await calculationDataSource.multiply(num1: num1, num2: num2);
    return mulRes.toEntity();
  }

  @override
  Future<Result> divide(double num1, double num2) async {
    final divRes = await calculationDataSource.divide(num1: num1, num2: num2);
    return divRes.toEntity();
  }
}
