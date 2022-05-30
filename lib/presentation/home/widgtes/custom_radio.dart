import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  final int value;
  final int groupValue;
  final Function(int?) onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<int>(
          value: value,
          groupValue: 0,
          onChanged: onChanged,
        ),
        Text(text),
      ],
    );
  }
}
