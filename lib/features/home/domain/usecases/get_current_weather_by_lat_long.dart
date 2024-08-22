
import 'package:aetheris/core/common/params.dart';
import 'package:aetheris/core/error/failure.dart';
import 'package:aetheris/core/usecase/usecase.dart';
import 'package:aetheris/features/home/domain/entity/weather_entity.dart';
import 'package:aetheris/features/home/domain/repository/weather_repository.dart';
import 'package:fpdart/fpdart.dart';






final class GetCurrentWeatherByLatLongUsecase implements UseCase<WeatherEntity,LatLongParams> {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherByLatLongUsecase({required WeatherRepository weatherRepository}) : _weatherRepository = weatherRepository;
  @override
  Future<Either<Failure, WeatherEntity>> call(LatLongParams param)  async{
    return await _weatherRepository.getCurrentWeatherByLatLong(latitude: param.latitude, longitude: param.longitude);
  }

}