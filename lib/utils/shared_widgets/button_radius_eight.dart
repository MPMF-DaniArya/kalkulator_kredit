import 'package:flutter/material.dart';

ElevatedButton ButtonRadiusEight(
    TextTheme textTheme, {
      required Color bgColor,
      required Color textColor,
      required Widget child,
      required VoidCallback onPressed,
    }) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      backgroundColor: bgColor,
      elevation: 2,
      foregroundColor: Colors.white,
      shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    child: child,
  );
}