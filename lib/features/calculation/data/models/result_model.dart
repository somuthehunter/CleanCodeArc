import 'package:calculator/features/calculation/domain/entities/result.dart';

class ResultModel extends Result {
  ResultModel({
    required double addResult,
    required double subResult,
    required double mulResult,
    required double divResult,
  }) : super(
          addResult: addResult,
          subResult: subResult,
          mulResult: mulResult,
          divResult: divResult,
        );

  factory ResultModel.fromJson({required Map<String, dynamic> json}) {
    return ResultModel(
      addResult: json['addResult'],
      subResult: json['subResult'],
      mulResult: json['mulResult'],
      divResult: json['divResult'],
    );
  }

  Result toEntity() {
    return Result(
      addResult: addResult,
      subResult: subResult,
      mulResult: mulResult,
      divResult: divResult,
    );
  }
}
