import 'package:bloc/bloc.dart';
import 'package:calculator/features/calculation/domain/entities/result.dart';
import 'package:calculator/features/calculation/domain/usecases/add_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/div_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/mul_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/subtract_use_case.dart';
import 'package:meta/meta.dart';

part 'calculation_event.dart';
part 'calculation_state.dart';

class CalculationBloc extends Bloc<CalculationEvent, CalculationState> {
  final AddUseCase addUseCase;
  final SubtractUseCase subtractUseCase;
  final MultiplyUseCase multiplyUseCase;
  final DivideUseCase divideUseCase;

  CalculationBloc({
    required this.addUseCase,
    required this.subtractUseCase,
    required this.multiplyUseCase,
    required this.divideUseCase,
  }) : super(CalculationInitial()) {
    on<AdditionEvent>((event, emit) async {
      final Result res = await addUseCase(event.num1, event.num2);
      emit(AdditionResult(result: res));
    });

    on<SubtractionEvent>((event, emit) async {
      final Result subRes = await subtractUseCase(event.num1, event.num2);

      emit(SubtractionResult(result: subRes));
    });

    on<MultiplicationEvent>((event, emit) async {
      final Result mulRes = await multiplyUseCase(event.num1, event.num2);
      emit(MultiplicationResult(result: mulRes));
    });

    on<DivisionEvent>((event, emit) async {
      if (event.num2 == 0) {
        emit(DivisionError(divisionErrorMessage: 'Infinity'));
        return;
      }
      final Result divRes = await divideUseCase(event.num1, event.num2);
      emit(DivisionResult(result: divRes));
    });
  }
}
