import 'package:flutter/material.dart';

enum PrimaryColor {
  amber(Colors.amber),
  cyan(Colors.cyan),
  teal(Colors.teal),
  pink(Colors.pink),
  purple(Colors.purple);

  const PrimaryColor(this.color);

  final Color color;
}
