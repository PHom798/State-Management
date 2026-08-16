import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../models/forecast_item_model.dart';
import '../models/weather_model.dart';

class WeatherService {
  static const baseUrl = 'http://api.openweathermap.org/data/2.5/weather';
  static const forecastUrl = 'http://api.openweathermap.org/data/2.5/forecast';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.reasonPhrase}');
    }
  }

  Future<Weather> getWeatherByCoordinates(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.reasonPhrase}');
    }
  }

  Future<List<ForecastItem>> getForecast(String cityName) async {
    final response = await http.get(
      Uri.parse('$forecastUrl?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> forecastList = data['list'];

      // Group forecasts by day and take one forecast per day
      Map<String, ForecastItem> dailyForecasts = {};

      for (var item in forecastList) {
        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
        String dateKey = '${dateTime.year}-${dateTime.month}-${dateTime.day}';

        // Only take the first forecast of each day (usually around 12:00)
        if (!dailyForecasts.containsKey(dateKey)) {
          dailyForecasts[dateKey] = ForecastItem.fromJson(item);
        }
      }

      // Return first 5 days
      return dailyForecasts.values.take(5).toList();
    } else {
      throw Exception('Failed to load forecast data: ${response.reasonPhrase}');
    }
  }

  Future<List<ForecastItem>> getForecastByCoordinates(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('$forecastUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> forecastList = data['list'];

      // Group forecasts by day and take one forecast per day
      Map<String, ForecastItem> dailyForecasts = {};

      for (var item in forecastList) {
        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
        String dateKey = '${dateTime.year}-${dateTime.month}-${dateTime.day}';

        if (!dailyForecasts.containsKey(dateKey)) {
          dailyForecasts[dateKey] = ForecastItem.fromJson(item);
        }
      }

      return dailyForecasts.values.take(5).toList();
    } else {
      throw Exception('Failed to load forecast data: ${response.reasonPhrase}');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission permanently denied");
    }

    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      throw Exception("Location permission not granted");
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemark = await Geocoding().placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );


    String? city = placemark.isNotEmpty ? placemark[0].locality : null;
    return city ?? "Unknown City";
  }

  Future<Position> getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission permanently denied");
    }

    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      throw Exception("Location permission not granted");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}