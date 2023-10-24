import 'dart:ui';
import 'package:flutter/material.dart';

class AdditionalItemInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalItemInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32),
        const SizedBox(height: 5),
        Text(label),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
