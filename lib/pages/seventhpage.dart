import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';

class _SeventhPageState extends State<SeventhPage> {
  String _city = 'London';
  String _weather = '';
  Timer? _timer;

  final List<String> _cities = [
    'London', 'New York', 'Tokyo', 'Paris', 'Berlin', 'Moscow', 'Sydney', 'Toronto', 'Dubai', 'Singapore',
    'Hong Kong', 'Bangkok', 'Rome', 'Istanbul', 'Los Angeles', 'Chicago', 'Mumbai', 'Beijing', 'Seoul', 'Madrid'
  ];

  @override
  void initState() {
    super.initState();
    _fetchWeather();
    _timer = Timer.periodic(Duration(seconds: 15), (Timer t) => _fetchWeather());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchWeather() async {
    final httpClient = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    final ioClient = IOClient(httpClient);

    final response = await ioClient.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=xxxxxxxxxxxxxxxxxxxxxxxxx&q=$_city&aqi=no'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _weather = 'City: ${data['location']['name']}\n'
                   'Temperature: ${data['current']['temp_c']}°C\n'
                   'Condition: ${data['current']['condition']['text']}\n'
                   'Humidity: ${data['current']['humidity']}%\n'
                   'Wind: ${data['current']['wind_kph']} kph';
      });
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seventh Page - Weather Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButton<String>(
              value: _city,
              onChanged: (String? newValue) {
                setState(() {
                  _city = newValue!;
                  _fetchWeather();
                });
              },
              items: _cities.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            if (_weather.isNotEmpty) ...[
              Text(
                _weather,
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Refresh Weather'),
            ),
          ],
        ),
      ),
    );
  }
}


class SeventhPage extends StatefulWidget {
  const SeventhPage({super.key});
  @override
  State<SeventhPage> createState() => _SeventhPageState();
}
