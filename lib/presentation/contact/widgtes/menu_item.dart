import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key? key,
      required this.icon,
      required this.text,
      required this.selected,
      required this.onTap})
      : super(key: key);
  final IconData icon;
  final String text;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: selected ? Colors.deepOrange : const Color(0xFF088AC6),
          ),
          const SizedBox(height: 4.0),
          Text(
            text,
            style: TextStyle(
                color: selected ? Colors.deepOrange : const Color(0xFF4E4E4E),
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
