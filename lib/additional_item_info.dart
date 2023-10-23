import 'dart:ui';
import 'package:flutter/material.dart';

class AdditionalItemInfo extends StatelessWidget {
  const AdditionalItemInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(Icons.water_drop, size: 32),
        SizedBox(height: 5),
        Text("Humidity"),
        SizedBox(height: 5),
        Text(
          "00",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
