import 'package:flutter/material.dart';

class ChangeAlertDialog extends StatelessWidget {
  const ChangeAlertDialog({
    super.key, this.title = 'item',
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Change Status'),
      content: Text('Are you sure you want to change $title?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
