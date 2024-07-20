import 'package:flutter/material.dart';

class NoNotesMessage extends StatelessWidget {
  const NoNotesMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.notes,
          size: 40,
          color: Colors.grey,
        ),
        Text(
          'No notes',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ],
    );
  }
}