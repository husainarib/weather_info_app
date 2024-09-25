import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _enterCity = TextEditingController();
  String cityName = 'City Name';
  String temperature = 'Temperature';
  String weatherCondition = 'Weather Condition';

  void _fetchWeather() {
    //implement method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _enterCity,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text(
                'Fetch Weather',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Text(
              cityName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              temperature,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              weatherCondition,
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
