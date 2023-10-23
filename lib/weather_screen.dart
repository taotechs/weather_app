import 'package:flutter/material.dart';

class WeatherScreenPage extends StatelessWidget {
  const WeatherScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        actions: const [Icon(Icons.replay_outlined)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(3, 3),
                  ),
                ],
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 150,
            width: 350,
            child: const Center(child: Text(" Weather")),
          ),
          Container(
            color: Colors.black45,
          ),
          Container(
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
