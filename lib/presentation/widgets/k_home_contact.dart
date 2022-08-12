import 'package:flutter/material.dart';

class KHomeContact extends StatelessWidget {
  const KHomeContact(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);
  final IconData icon;
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        visualDensity: VisualDensity.compact,
        horizontalTitleGap: 0,
        onTap: onTap,
        leading: Icon(
          icon,
          color: const Color(0xFF088AC6),
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF7A7C79),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
