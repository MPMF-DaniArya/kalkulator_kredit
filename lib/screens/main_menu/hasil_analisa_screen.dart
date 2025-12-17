import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_kredit/screens/main_menu/calculator_logic.dart';
import 'package:kalkulator_kredit/utils/constant/colors.dart';
import 'package:kalkulator_kredit/utils/constant/sizes.dart';

class HasilAnalisaScreen extends StatelessWidget {
  const HasilAnalisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final logic = Get.find<CalculatorLogic>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: TColors.primaryColor,
        title: Text(
          'Hasil Analisa Kredit Anda',
          style: textTheme.headlineSmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.spaceBtwSections),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Credit Score Anda',
              style: textTheme.titleLarge,
            ),
            Obx(() => Text(logic.creditScoreUser.value.toString())),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Risiko Anda',
              style: textTheme.titleLarge,
            ),
            Obx(() => Text(logic.risikoUser.value.toString())),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Action Anda',
              style: textTheme.titleLarge,
            ),
            Obx(() => Text(logic.actionUser.value)),
            const SizedBox(
              height: 32,
            ),
          ],
        )),
      )),
    );
  }
}
