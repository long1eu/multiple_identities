import 'dart:math';

import 'package:flutter/material.dart';

class RandomColor {
  static int get color {
    Random _random = new Random();
    final MaterialColor color = Colors.primaries[_random.nextInt(18)];
    return color[(_random.nextInt(5) + 4) * 100].value;
  }
}
