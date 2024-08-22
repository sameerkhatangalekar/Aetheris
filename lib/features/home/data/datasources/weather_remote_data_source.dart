

import 'package:aetheris/core/constants/secrets.dart';
import 'package:aetheris/core/error/server_exception.dart';
import 'package:aetheris/core/utils/error_processor.dart';
import 'package:aetheris/core/utils/extension.dart';
import 'package:aetheris/features/home/data/model/weather_model.dart';
import 'package:dio/dio.dart';

abstract interface class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherDataByLatLong(
      {required double latitude, required double longitude});
  Future<WeatherModel> getWeatherDataByLocation(
      {required String location});
}

final class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio _dio;

  WeatherRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<WeatherModel> getWeatherDataByLatLong(
      {required double latitude, required double longitude}) async {
    try {
      final result = await _dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=$weatherApiKey&q=$latitude,$longitude&days=3&aqi=yes&alerts=no');
      WeatherModel.fromJson(result.data).log();
      return WeatherModel.fromJson(result.data);
    } on DioException catch (e) {
      throw ServerException(message: dioErrorProcessor(e));
    }
  }

  @override
  Future<WeatherModel> getWeatherDataByLocation({required String location}) async {
    try {
      final result = await _dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=$weatherApiKey&q=$location&days=3&aqi=yes&alerts=no');
      WeatherModel.fromJson(result.data).log();
      return WeatherModel.fromJson(result.data);
    } on DioException catch (e) {
      throw ServerException(message: dioErrorProcessor(e));
    }
  }

}
