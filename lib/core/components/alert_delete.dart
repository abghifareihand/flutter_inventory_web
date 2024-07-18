import 'package:flutter/material.dart';

class AlertDelete extends StatelessWidget {
  final String message;
  final Function() onPressed;

  const AlertDelete({
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
        Icons.delete_outline_rounded,
        size: 48,
        color: Colors.grey,
      ),
      content: Text(message),
      actions: [
        SizedBox(
          height: 36,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.blue),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            child: const Text('Batal'),
          ),
        ),
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
            child: const Text('Hapus'),
          ),
        ),
      ],
    );
  }
}
