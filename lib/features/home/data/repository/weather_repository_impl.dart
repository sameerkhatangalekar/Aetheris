import 'package:aetheris/core/error/failure.dart';
import 'package:aetheris/core/error/server_exception.dart';
import 'package:aetheris/features/home/data/datasources/weather_remote_data_source.dart';
import 'package:aetheris/features/home/domain/entity/weather_entity.dart';
import 'package:aetheris/features/home/domain/repository/weather_repository.dart';
import 'package:fpdart/fpdart.dart';


final class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  WeatherRepositoryImpl(
      {required WeatherRemoteDataSource weatherRemoteDataSource})
      : _weatherRemoteDataSource = weatherRemoteDataSource;

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByLocation(
      {required String location}) async {
    try {
      final result = await _weatherRemoteDataSource.getWeatherDataByLocation(
          location: location);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByLatLong({required double latitude, required double longitude})  async{
    try {
      final result = await _weatherRemoteDataSource.getWeatherDataByLatLong(
          latitude: latitude, longitude: longitude);
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  // @override
  // Future<Either<Failure, List<Weather>>> getFiveDayForecastByLocation(
  //     {required double latitude, required double longitude}) async {
  //   try {
  //     final result =
  //         await _weatherRemoteDataSource.getFiveDayForecastByLocation(
  //             latitude: latitude, longitude: longitude);
  //     return right(result);
  //   } on ServerException catch (e) {
  //     return left(Failure(message: e.message));
  //   }
  // }
}
