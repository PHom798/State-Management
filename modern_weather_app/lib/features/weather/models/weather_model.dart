// weatherModel.dart
class Weather {
  final String cityName;
  final double tempr;
  final String mainCondition;
  final String description;
  final double feelsLike;
  final int humidity;
  final double pressure;
  final double windSpeed;
  final int visibility;
  final DateTime dateTime;

  Weather({
    required this.cityName,
    required this.tempr,
    required this.mainCondition,
    required this.description,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.visibility,
    required this.dateTime,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] ?? 'Unknown',
      tempr: (json['main']['temp'] ?? 0).toDouble(),
      mainCondition: json['weather'][0]['main'] ?? 'Unknown',
      description: json['weather'][0]['description'] ?? 'No description',
      feelsLike: (json['main']['feels_like'] ?? 0).toDouble(),
      humidity: json['main']['humidity'] ?? 0,
      pressure: (json['main']['pressure'] ?? 0).toDouble(),
      windSpeed: (json['wind']['speed'] ?? 0).toDouble(),
      visibility: json['visibility'] ?? 10000,
      dateTime: DateTime.fromMillisecondsSinceEpoch((json['dt'] ?? 0) * 1000),
    );
  }
}