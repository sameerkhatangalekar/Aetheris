import 'package:aetheris/core/common/params.dart';
import 'package:aetheris/features/home/domain/entity/weather_entity.dart';
import 'package:aetheris/features/home/domain/usecases/get_current_weather_by_lat_long.dart';
import 'package:aetheris/features/home/domain/usecases/get_current_weather_by_location.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

part 'home_event.dart';

part 'home_state.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherByLocationUsecase _getCurrentWeatherForecastByLocation;
  final GetCurrentWeatherByLatLongUsecase _getCurrentWeatherByLatLongUsecase;

  HomeBloc({
    required GetCurrentWeatherByLocationUsecase
        getCurrentWeatherByLocationUsecase,
    required GetCurrentWeatherByLatLongUsecase
        getCurrentWeatherByLatLongUsecase,
  })  : _getCurrentWeatherForecastByLocation =
            getCurrentWeatherByLocationUsecase,
        _getCurrentWeatherByLatLongUsecase = getCurrentWeatherByLatLongUsecase,
        super(const HomeInitial()) {
    on<CurrentWeatherRequestedEvent>((event, emit) async {
      emit(const CurrentWeatherDataLoadingState());


      if (event.location != null && event.location!.isNotEmpty) {
        final result = await _getCurrentWeatherForecastByLocation(
          LocationParams(location: event.location!),
        );

        result.fold(
          (l) => emit(
            CurrentWeatherDataLoadingFailedState(message: l.message),
          ),
          (r) => emit(
            CurrentWeatherDataLoadedState(currentWeather: r),
          ),
        );
      }
      else {

        final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
        final hasPermission = await Geolocator.checkPermission();
        if (isServiceEnabled && (hasPermission == LocationPermission.always ||hasPermission == LocationPermission.whileInUse) ) {

          const LocationSettings locationSettings = LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 100,
          );

          Position position = await Geolocator.getCurrentPosition(
            locationSettings: locationSettings,
          );

          final result = await _getCurrentWeatherByLatLongUsecase(
            LatLongParams(
                latitude: position.latitude, longitude: position.longitude),
          );

          result.fold(
            (l) => emit(
              CurrentWeatherDataLoadingFailedState(message: l.message),
            ),
            (r) => emit(
              CurrentWeatherDataLoadedState(currentWeather: r),
            ),
          );
        } else {

          emit(
            const CurrentWeatherDataLoadingFailedState(message: 'Location service is required to get current location weather'),
          );
        }
      }
    }, transformer: debounce(const Duration(milliseconds: 400)));
  }

  @override
  void onEvent(HomeEvent event) {
    super.onEvent(event);
  }
}
