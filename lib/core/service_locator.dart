import 'package:calculator/features/calculation/data/data%20sources/remote/calculation_data_source.dart';
import 'package:calculator/features/calculation/data/repository/calculation_repository_implementation.dart';
import 'package:calculator/features/calculation/domain/usecases/div_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/mul_use_case.dart';
import 'package:calculator/features/calculation/domain/usecases/subtract_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:calculator/features/calculation/domain/repository/calculation_repository.dart';
import 'package:calculator/features/calculation/domain/usecases/add_use_case.dart';
import 'package:calculator/features/calculation/presentation/bloc/calculation_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // If you have any async code like initializing services or databases, ensure they are awaited
  // await SomeAsyncInitialization();

  sl.registerLazySingleton<CalculationDataSource>(
      () => CalculationDataSourceImpl());

  sl.registerLazySingleton<CalculationRepository>(
    () => CalculationRepositoryImpl(calculationDataSource: sl()),
  );

  sl.registerLazySingleton(() => AddUseCase(repository: sl()));
  sl.registerLazySingleton(() => SubtractUseCase(repository: sl()));
  sl.registerLazySingleton(() => MultiplyUseCase(repository: sl()));
  sl.registerLazySingleton(() => DivideUseCase(repository: sl()));

  sl.registerFactory(() => CalculationBloc(
        addUseCase: sl(),
        subtractUseCase: sl(),
        multiplyUseCase: sl(),
        divideUseCase: sl(),
      ));
}
