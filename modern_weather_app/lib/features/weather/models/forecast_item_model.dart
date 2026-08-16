class ForecastItem {
  final DateTime dateTime;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final String mainCondition;
  final String description;
  final int humidity;
  final double windSpeed;
  final String dayName;

  ForecastItem({
    required this.dateTime,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.mainCondition,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.dayName,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000);

    return ForecastItem(
      dateTime: dateTime,
      temperature: (json['main']['temp'] ?? 0).toDouble(),
      minTemperature: (json['main']['temp_min'] ?? 0).toDouble(),
      maxTemperature: (json['main']['temp_max'] ?? 0).toDouble(),
      mainCondition: json['weather'][0]['main'] ?? 'Unknown',
      description: json['weather'][0]['description'] ?? 'No description',
      humidity: json['main']['humidity'] ?? 0,
      windSpeed: (json['wind']['speed'] ?? 0).toDouble(),
      dayName: _getDayName(dateTime),
    );
  }

  static String _getDayName(DateTime dateTime) {
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[dateTime.weekday - 1];
  }
}