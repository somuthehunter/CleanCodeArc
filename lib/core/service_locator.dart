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

void init() {
  // Register the data source
  sl.registerLazySingleton<CalculationDataSource>(
      () => CalculationDataSourceImpl());

  // Register repository and inject the data source into the repository
  sl.registerLazySingleton<CalculationRepository>(
    () => CalculationRepositoryImpl(calculationDataSource: sl()),
  );

  // Register use cases
// Register use cases
  sl.registerLazySingleton(() => AddUseCase(repository: sl()));
  sl.registerLazySingleton(() => SubtractUseCase(repository: sl()));
  sl.registerLazySingleton(() => MultiplyUseCase(repository: sl()));
  sl.registerLazySingleton(() => DivideUseCase(repository: sl()));

  // Register Bloc
  sl.registerFactory(() => CalculationBloc(
        addUseCase: sl(),
        subtractUseCase: sl(),
        multiplyUseCase: sl(),
        divideUseCase: sl(),
      ));
}
