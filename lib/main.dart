import 'package:flutter/material.dart';
import 'package:weather_app/secrets.dart';
import 'package:weather_app/weather_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    getCurrrentWeather();
  }

  Future getCurrrentWeather() async {
    String cityName = "Poland";
    // ignore: unused_local_variable
    final res = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q={$cityName}&APPID={$ApiKey}"));

    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const WeatherScreenPage(),
    );
  }
}
