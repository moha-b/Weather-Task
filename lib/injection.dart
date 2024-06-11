import 'package:get_it/get_it.dart';

import 'features/home/data/datasources/remote_data_source.dart';
import 'features/home/data/repositories/weather_repository_impl.dart';
import 'features/home/domain/repositories/weather_repository.dart';
import 'features/home/domain/usecases/get_current_weather.dart';
import 'features/home/presentation/bloc/weather_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeather(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );
}
