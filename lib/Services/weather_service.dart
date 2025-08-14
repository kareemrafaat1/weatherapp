import 'package:dio/dio.dart';
import '../Models/wearher_model.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "92addd08c1d64edca65174602252405";

  WeatherService({required this.dio});

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      final response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no",
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception("Failed to load weather data: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception("City not found. Please try another location.");
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}