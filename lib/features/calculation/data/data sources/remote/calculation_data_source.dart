import 'package:calculator/features/calculation/data/models/result_model.dart';

abstract class CalculationDataSource {
  Future<ResultModel> add({required double num1, required double num2});
  Future<ResultModel> subtract({required double num1, required double num2});
  Future<ResultModel> multiply({required double num1, required double num2});
  Future<ResultModel> divide({required double num1, required double num2});
}

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
