import 'dart:core';

import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool _isCelsius = true;
  bool _isDarkMode = false;

  bool _isLoading = false;
  String ? _error;

  List<String> _recentSearches =[];
  List<String> _favouriteCities =[];

  final TextEditingController _cityController = TextEditingController();

  //toggle celsius
  void _toggleTemperatureUnit() {
    setState(() {
      _isCelsius = !_isCelsius;
    });
  }

  //toggle dark mode
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isCelsius ? Icons.device_thermostat : Icons.thermostat),
            onPressed: _toggleTemperatureUnit,
            tooltip: 'Toggle ${_isCelsius ? 'Fahrenheit' : 'Celsius'}',
          ),
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: _toggleTheme,
            tooltip: 'Toggle Theme',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            //search Bar
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  border: InputBorder.none,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.my_location),

                        onPressed: (){},
                        tooltip: 'Current Location',
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: (){},
                      ),
                    ],
                  ),

                ),

              ),),
            ),
          ],
        ),
      ),
    );
  }
}
