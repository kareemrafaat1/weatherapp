import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherapp/Models/wearher_model.dart';
import 'package:weatherapp/Services/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;
  String? cityName;

  WeatherCubit(this.weatherService) : super(WeatherInitial());

  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherService.getWeatherData(cityName: cityName);
      this.cityName = cityName;
      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(errorMessage: e.toString()));
    }
  }
}