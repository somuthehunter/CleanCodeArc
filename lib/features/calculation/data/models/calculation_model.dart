// calculation_model.dart

import 'package:calculator/features/calculation/domain/entities/calculation_entity.dart';

class CalculationModel extends Calculationentity {
  CalculationModel({
    required super.num1,
    required super.num2,
  });

  // Method to convert the model to a Map (for sending to APIs)
  Map<String, dynamic> toJson() {
    return {
      'num1': num1,
      'num2': num2,
    };
  }

  // Factory method to create a model from a Map (for receiving from APIs)
  factory CalculationModel.fromJson(Map<String, dynamic> json) {
    return CalculationModel(
      num1: json['num1'].toDouble(),
      num2: json['num2'].toDouble(),
    );
  }
}
