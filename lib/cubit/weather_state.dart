part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final  WeatherModel weatherModel;
  WeatherSuccess({required this.weatherModel});
}

class WeatherFailure extends WeatherState {
  final String errorMessage;
  WeatherFailure({required this.errorMessage});
}