import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Models/wearher_model.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weather;

  const WeatherInfoBody({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weather.getThemeColor(),
            weather.getThemeColor()[300]!,
            weather.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              BlocProvider.of<WeatherCubit>(context).cityName ?? 'Unknown City',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Updated at ${weather.date.hour.toString().padLeft(2, '0')}:${weather.date.minute.toString().padLeft(2, '0')}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  weather.getImage(),
                  width: 100,
                  height: 100,
                  color: Colors.white,
                ),
                Text(
                  "${weather.temp.toInt()}°C",
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Max: ${weather.maxTemp.toInt()}°C",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "Min: ${weather.minTemp.toInt()}°C",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              weather.weatherName,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}