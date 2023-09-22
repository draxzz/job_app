import "package:flutter/material.dart";

//Snackbar
void showSnackBar(BuildContext context, String type, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: type == "error" ? Colors.red : Colors.teal,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    duration: const Duration(milliseconds: 3000),
    action: SnackBarAction(
      label: 'Dismiss',
      disabledTextColor: Colors.white,
      textColor: Colors.yellow,
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        //ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
