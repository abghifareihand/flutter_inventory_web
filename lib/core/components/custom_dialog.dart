import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String message;
  final Function() onPressed;

  const CustomDialog({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      icon: const Icon(
        Icons.check_circle_outline_outlined,
        size: 52,
        color: Colors.blue,
      ),
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        SizedBox(
          height: 36,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            child: const Text('Back to Home'),
          ),
        ),
      ],
    );
  }
}
