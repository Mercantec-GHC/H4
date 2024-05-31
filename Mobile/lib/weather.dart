import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherForecastPage extends StatefulWidget {
  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  List<dynamic> forecasts = [];

  Future<void> fetchForecasts() async {
    final response =
        await http.get(Uri.parse('https://h4api.onrender.com/WeatherForecast'));

    if (response.statusCode == 200) {
      setState(() {
        forecasts = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load forecasts');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchForecasts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: ListView.builder(
        itemCount: forecasts.length,
        itemBuilder: (context, index) {
          var forecast = forecasts[index];
          return ListTile(
            title: Text(forecast['date']),
            subtitle: Text(
                '${forecast['temperatureC']}°C / ${forecast['temperatureF']}°F - ${forecast['summary']}'),
          );
        },
      ),
    );
  }
}
