part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  const HomeEvent();
}

final class CurrentWeatherRequestedEvent implements HomeEvent {
  final String? location;
  const CurrentWeatherRequestedEvent({this.location});
}
