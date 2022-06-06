import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xFF088AC6),
        ),
        const SizedBox(height: 4.0),
        Text(
          text,
          style: const TextStyle(
              color: Color(0xFF4E4E4E),
              fontSize: 12
          ),
        ),
      ],
    );
    // return Column(
    //   children: [
    //     IconButton(
    //       icon: icon,
    //       iconSize: 25,
    //       color: const Color(0xFF088AC6),
    //       onPressed: () {},
    //     ),
    //     Text(
    //       text,
    //       style: const TextStyle(
    //         color: Color(0xFF4E4E4E),
    //         fontSize: 12,
    //       ),
    //     ),
    //   ],
    // );
  }
}