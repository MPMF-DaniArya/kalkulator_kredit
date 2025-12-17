import 'package:flutter/material.dart';

ElevatedButton ButtonSubmit(
    TextTheme textTheme, {
      required Color bgColor,
      required Color textColor,
      required List<Widget> child,
      required VoidCallback onPressed,
    }) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 14),
      backgroundColor: bgColor,
      elevation: 2,
      foregroundColor: Colors.white,
      shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: child),
  );
}