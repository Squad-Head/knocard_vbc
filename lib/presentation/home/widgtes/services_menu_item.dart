import 'package:flutter/material.dart';

class ServicesMenuItem extends StatelessWidget {
  const ServicesMenuItem({Key? key, required this.icon, required this.text})
      : super(key: key);
  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: icon,
          iconSize: 15,
          color: const Color(0xFF088AC6),
          onPressed: () {},
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF525252),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
