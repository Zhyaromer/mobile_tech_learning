import 'package:flutter/material.dart';

class PhoneComponent {
  const PhoneComponent({
    required this.name,
    required this.icon,
    required this.function,
    required this.importance,
    required this.example,
  });

  final String name;
  final IconData icon;
  final String function;
  final String importance;
  final String example;
}
