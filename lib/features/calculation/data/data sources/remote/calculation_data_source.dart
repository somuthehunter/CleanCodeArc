import 'package:calculator/features/calculation/data/models/result_model.dart';

/// The [CalculationDataSource] interface defines the contract for performing
/// arithmetic operations and returning a [ResultModel].
abstract class CalculationDataSource {
  /// Performs addition on two numbers and returns the result as a [ResultModel].
  Future<ResultModel> add({required double num1, required double num2});

  /// Performs subtraction on two numbers and returns the result as a [ResultModel].
  Future<ResultModel> subtract({required double num1, required double num2});

  /// Performs multiplication on two numbers and returns the result as a [ResultModel].
  Future<ResultModel> multiply({required double num1, required double num2});

  /// Performs division on two numbers and returns the result as a [ResultModel].
  Future<ResultModel> divide({required double num1, required double num2});
}

/// The [CalculationDataSourceImpl] class implements [CalculationDataSource] and
/// provides concrete methods to perform the arithmetic operations, returning results
/// as [ResultModel] objects.
class CalculationDataSourceImpl extends CalculationDataSource {
  @override
  Future<ResultModel> add({required double num1, required double num2}) async {
    final double res = num1 + num2;
    return ResultModel.fromJson(json: {'result': res});
  }

  @override
  Future<ResultModel> subtract(
      {required double num1, required double num2}) async {
    final double res = num1 - num2;
    return ResultModel.fromJson(json: {'result': res});
  }

  @override
  Future<ResultModel> multiply(
      {required double num1, required double num2}) async {
    final double res = num1 * num2;
    return ResultModel.fromJson(json: {'result': res});
  }

  @override
  Future<ResultModel> divide(
      {required double num1, required double num2}) async {
    final double res = num1 / num2;
    return ResultModel.fromJson(json: {'result': res});
  }
}
