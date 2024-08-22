part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => const [];
}

final class CurrentWeatherDataLoadingState extends HomeState {
  const CurrentWeatherDataLoadingState();

  @override
  List<Object?> get props => const [];
}

final class CurrentWeatherDataLoadedState extends HomeState {
  final WeatherEntity currentWeather;


  const CurrentWeatherDataLoadedState(
      {required this.currentWeather});

  @override
  List<Object?> get props => [currentWeather];
}

final class CurrentWeatherDataLoadingFailedState extends HomeState {
  final String message;

  const CurrentWeatherDataLoadingFailedState({required this.message});

  @override
  List<Object?> get props => [message];
}






