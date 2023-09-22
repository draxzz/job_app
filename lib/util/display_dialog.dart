import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Dialog extends StatelessWidget {
  Dialog({super.key, required this.title, required this.text});
  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
