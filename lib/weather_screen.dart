import 'dart:convert';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:weather_app/secrets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'additional_item_info.dart';
import 'hourly_forecast_item.dart';

class WeatherScreenPage extends StatefulWidget {
  const WeatherScreenPage({super.key});

  @override
  State<WeatherScreenPage> createState() => _WeatherScreenPageState();
}

class _WeatherScreenPageState extends State<WeatherScreenPage> {
  double temp = 0.0;

  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getCurrrentWeather() async {
    try {
      String cityName = "Sosnowiec";
      final res = await http.get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$ApiKey"));

      final data = jsonDecode(res.body);
      // print(res.body);
      if (data['cod'] != "200") {
        throw 'An unexpected error occurred';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weather = getCurrrentWeather();
              });
            },
            icon: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!;

          final currWeather = data['list'][0];

          final currentSky = currWeather['weather'][0]['main'];
          final currentTemp = currWeather['main']['temp'];
          final currentHumidity = currWeather['main']['humidity'];
          final currentPressure = currWeather['main']['pressure'];
          final currentWindSpeed = currWeather['wind']['speed'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$currentTemp K",
                                style: const TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? Icons.cloud_sharp
                                    : Icons.sunny,
                                size: 64,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "$currentSky ",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Hourly Forecast",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final hourlySky = data['list'][index + 1];
                      final time = DateTime.parse(hourlySky['dt_txt']);
                      return HourlyForecastItem(
                        time: DateFormat.jm().format(time),
                        icon: hourlySky['weather'][0]['main'] == 'Clouds' ||
                                hourlySky['weather'][0]['main'] == 'Rain'
                            ? Icons.cloud
                            : Icons.sunny,
                        temperature: hourlySky['main']['temp'].toString(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Additional information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalItemInfo(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: currentHumidity.toString(),
                    ),
                    AdditionalItemInfo(
                      icon: Icons.air,
                      label: "Wind Speed",
                      value: currentWindSpeed.toString(),
                    ),
                    AdditionalItemInfo(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: currentPressure.toString(),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
