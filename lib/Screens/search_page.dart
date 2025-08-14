import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                labelText: "Enter city name",
                hintText: "e.g. London, New York",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _searchCity(context),
                ),
              ),
              onSubmitted: (_) => _searchCity(context),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _searchCity(context),
              child: const Text("Get Weather"),
            ),
          ],
        ),
      ),
    );
  }

  void _searchCity(BuildContext context) {
    final cityName = _searchController.text.trim();
    if (cityName.isNotEmpty) {
      BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName);
      Navigator.pop(context);
    }
  }
}