import 'package:flutter/material.dart';

import '../constant/colors.dart';

class TInputText extends StatelessWidget {
  const TInputText({
    super.key,
    required this.labelText,
    required this.inputType,
    this.onSaved,
    this.minLength = 4,
    this.maxLength = 4,
    this.autoCorrect = false,
    this.enableSuggestions = false,
    required this.icon,
    this.controller,
  });

  final String labelText;
  final int maxLength;
  final IconData icon;
  final int minLength;
  final TextInputType inputType;
  final bool autoCorrect;
  final bool enableSuggestions;
  final void Function(String? value)? onSaved;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: labelText,
        prefixIcon: Icon(icon, color: TColors.secondText, size: 22,),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: TColors.secondText),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: TColors.secondText),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: TColors.primaryColor, width: 2),
        ),
      ),
      maxLength: maxLength,
      keyboardType: inputType,
      autocorrect: autoCorrect,
      enableSuggestions: enableSuggestions,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty || value.trim().length < minLength) {
          return 'Panjang input minimal $minLength karakter';
        }

        return null;
      },
    );
  }
}