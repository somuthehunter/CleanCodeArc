import 'package:calculator/features/calculation/domain/entities/result.dart';

abstract class CalculationRepository {
  Future<Result> add(double num1, double num2);
  Future<Result> subtract(double num1, double num2);
  Future<Result> multiply(double num1, double num2);
  Future<Result> divide(double num1, double num2);
}
