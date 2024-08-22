import 'package:aetheris/features/home/data/datasources/weather_remote_data_source.dart';
import 'package:aetheris/features/home/data/repository/weather_repository_impl.dart';
import 'package:aetheris/features/home/domain/repository/weather_repository.dart';
import 'package:aetheris/features/home/domain/usecases/get_current_weather_by_lat_long.dart';
import 'package:aetheris/features/home/domain/usecases/get_current_weather_by_location.dart';
import 'package:aetheris/features/home/representation/bloc/home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

void initDependency() {
  injectWeatherFactory();
  injectHomeBloc();
}

void injectWeatherFactory() {
  serviceLocator.registerLazySingleton(() => Dio(), instanceName: 'globalDio');
}

void injectHomeBloc() {
  serviceLocator
    ..registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(
          dio: serviceLocator(instanceName: 'globalDio')),
    )
    ..registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(
        weatherRemoteDataSource: serviceLocator(),
      ),
    )
    ..registerLazySingleton<GetCurrentWeatherByLatLongUsecase>(
      () => GetCurrentWeatherByLatLongUsecase(
        weatherRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton<GetCurrentWeatherByLocationUsecase>(
      () => GetCurrentWeatherByLocationUsecase(
        weatherRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton<HomeBloc>(
      () => HomeBloc(
        getCurrentWeatherByLatLongUsecase: serviceLocator(),
        getCurrentWeatherByLocationUsecase: serviceLocator(),
      ),
    );
}
