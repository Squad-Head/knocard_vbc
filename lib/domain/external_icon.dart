import 'package:flutter/material.dart';

class ExternalIcon {
  IconData icon;
  double size;
  ExternalIcon({required this.icon, required this.size});

  Icon iconWidget({Color color = const Color(0xff088AC7)}) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
