import 'package:calculator/features/calculation/domain/entities/result.dart';

class ResultModel extends Result {
  ResultModel({
    required super.answer,
  });

  factory ResultModel.fromJson({required Map<String, dynamic> json}) {
    return ResultModel(
      answer: json['result'],
    );
  }

  Result toEntity() {
    return Result(answer: answer);
  }
}
