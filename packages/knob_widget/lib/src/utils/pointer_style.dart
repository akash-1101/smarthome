import 'package:flutter/material.dart';

class PointerStyle {
  final double width;
  final double height;
  final double offset;
  final Color color;

  const PointerStyle({
    this.width = 50,
    this.height = 50,
    this.offset = 0,
    this.color = Colors.black,
  });
}
