import 'package:flutter/material.dart';
import 'dart:math';

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
  final TextEditingController controller = TextEditingController();
  String city = 'City Name';
  String temperature = 'Temperature';
  String weatherCondition = 'Weather Condition';
  List<Map<String, String>> forecast = [];
  void _fetchWeather() {
    String newcity = controller.text;
    Random random = Random();
    int randTemp = 15 + random.nextInt(16);
    List<String> weather = ["sunny", "cloudy", "rainy"];
    String randWeather = weather[random.nextInt(weather.length)];

    setState(() {
      city = newcity;
      temperature = '$randTemp°C';
      weatherCondition = randWeather;
    });
  }

  void _fetchForecast() {
    Random random = Random();
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];

    List<Map<String, String>> newForecast = List.generate(7, (index) {
      int temp = 15 + random.nextInt(16);
      String condition = conditions[random.nextInt(conditions.length)];
      return {
        "day": "Day ${index + 1}",
        "temperature": "$temp°C",
        "Weather": condition,
      };
    });

    setState(() {
      forecast = newForecast;
    });
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
              controller: controller,
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
              city,
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
            ElevatedButton(
              onPressed: _fetchForecast,
              child: Text(
                'Fetch 7-Day Forecast',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              '7-Day Weather Forecast',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            //need to scroll to see full 7 days
            SizedBox(
                height: 300,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: forecast.length,
                    itemBuilder: (context, index) {
                      final dayForecast = forecast[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(dayForecast["day"]!),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Temp: ${dayForecast["temperature"]}"),
                              Text("Weather: ${dayForecast["condition"]}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
