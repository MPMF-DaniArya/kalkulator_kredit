import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_kredit/screens/main_menu/calculator_logic.dart';
import 'package:kalkulator_kredit/utils/constant/colors.dart';

class OptionSheet extends StatelessWidget {
  const OptionSheet(
      {super.key,
      required this.options,
      required this.title,
      this.selectedValue,
      required this.onSelect});

  final String title;
  final List<String> options;
  final String? selectedValue;
  final Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CalculatorLogic>();

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ...options.map((option) {
            bool isSelected = selectedValue == option;

            return ListTile(
              onTap: () {
                onSelect(option);

                Get.back();
              },
              title: Text(
                option,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.green : Colors.black,
                ),
              ),
              trailing: isSelected
                  ? const Icon(Icons.check_circle, color: TColors.primaryColor)
                  : const Icon(Icons.circle_outlined, color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            );
          }),
        ],
      ),
    );
  }
}
