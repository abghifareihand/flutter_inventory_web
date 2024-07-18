import 'package:flutter/material.dart';

class ButtonElevated extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;

  const ButtonElevated({
    super.key,
    required this.color,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(title),
    );
  }
}
