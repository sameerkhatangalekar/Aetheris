import 'package:aetheris/core/error/failure.dart';
import 'package:aetheris/features/home/domain/entity/weather_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByLatLong(
      {required double latitude, required double longitude});
  Future<Either<Failure, WeatherEntity>> getCurrentWeatherByLocation(
      {required String location});

}
