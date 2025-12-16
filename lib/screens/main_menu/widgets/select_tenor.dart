import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_kredit/screens/main_menu/calculator_logic.dart';
import 'package:kalkulator_kredit/utils/constant/score.dart';

class SelectTenor extends StatelessWidget {
  const SelectTenor({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CalculatorLogic>();

    final List<String> options = [
      '12',
      '24',
      '36',
      '48'
    ];

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
              "Pilih Home Status",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ...options.map((option) {
            bool isSelected = logic.state.selectedTenor == int.parse(option);

            return ListTile(
              onTap: () {
                logic.state.selectedTenor = int.parse(option);

                logic.update();

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
                  ? const Icon(Icons.check_circle, color: Colors.green)
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
