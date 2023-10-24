import 'dart:ui';

import 'package:flutter/material.dart';

import 'additional_item_info.dart';
import 'hourly_forecast_item.dart';

class WeatherScreenPage extends StatelessWidget {
  const WeatherScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
      body: Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "300K",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Icon(
                            Icons.cloud_sharp,
                            size: 64,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Rain",
                            style: TextStyle(fontSize: 20),
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
              "Weather Forecast",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: '12:00',
                    icon: Icons.cloud,
                    temperature: '33.0',
                  ),
                  HourlyForecastItem(
                      time: "13:00", icon: Icons.sunny, temperature: "44.2"),
                  HourlyForecastItem(
                    time: "14:00",
                    icon: Icons.sunny_snowing,
                    temperature: "43.7",
                  ),
                  HourlyForecastItem(
                    time: "15:00",
                    icon: Icons.cloudy_snowing,
                    temperature: "39",
                  ),
                  HourlyForecastItem(
                    time: "16:00",
                    icon: Icons.cloud,
                    temperature: "10.2",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Additional information",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalItemInfo(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "60",
                ),
                AdditionalItemInfo(
                  icon: Icons.air,
                  label: "Wind Speed",
                  value: "100",
                ),
                AdditionalItemInfo(
                  icon: Icons.beach_access,
                  label: "Pressure",
                  value: "413",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
