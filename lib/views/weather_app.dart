import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final TextEditingController _cityController = TextEditingController();
  String _weatherInfo = "Enter a city to get weather details";
  bool _isLoading = false;

  final String _apiKey = "YOUR_API_KEY"; //Replace with your OpenWeatherMap API key//
  final String _baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  Future<void> _fetchWeather(String city) async {
    setState(() {
      _isLoading = true;
      _weatherInfo = "Fetching weather data...";
    });
    try {
      final response = await http.get(Uri.parse("$_baseUrl?q=$city&appid=$_apiKey&units=metric"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}