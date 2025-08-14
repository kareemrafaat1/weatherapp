import 'package:flutter/material.dart';

class WeatherModel {
  final DateTime date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final currentData = json['current'];
    final forecastDay = json['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: DateTime.parse(currentData['last_updated']),
      temp: currentData['temp_c'].toDouble(),
      minTemp: forecastDay['mintemp_c'].toDouble(),
      maxTemp: forecastDay['maxtemp_c'].toDouble(),
      weatherName: currentData['condition']['text'],
    );
  }

  String getImage() {
    if (weatherName.toLowerCase().contains('sunny') ||
        weatherName.toLowerCase().contains('clear')) {
      return 'assets/images/clear.png';
    } else if (weatherName.toLowerCase().contains('snow')) {
      return 'assets/images/snow.png';
    } else if (weatherName.toLowerCase().contains('rain') ||
        weatherName.toLowerCase().contains('shower')) {
      return 'assets/images/rainy.png';
    } else if (weatherName.toLowerCase().contains('cloud')) {
      return 'assets/images/cloudy.png';
    } else if (weatherName.toLowerCase().contains('thunder') ||
        weatherName.toLowerCase().contains('storm')) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherName.toLowerCase().contains('sunny') ||
        weatherName.toLowerCase().contains('clear')) {
      return Colors.orange;
    } else if (weatherName.toLowerCase().contains('snow')) {
      return Colors.blue;
    } else if (weatherName.toLowerCase().contains('rain')) {
      return Colors.blue;
    } else if (weatherName.toLowerCase().contains('cloud')) {
      return Colors.blueGrey;
    } else if (weatherName.toLowerCase().contains('thunder')) {
      return Colors.deepPurple;
    } else {
      return Colors.blue;
    }
  }

  @override
  String toString() {
    return 'WeatherModel($weatherName: $temp°C)';
  }
}