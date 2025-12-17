import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_kredit/screens/main_menu/calculator_logic.dart';
import 'package:kalkulator_kredit/utils/constant/colors.dart';
import 'package:kalkulator_kredit/utils/constant/score.dart';
import 'package:kalkulator_kredit/utils/constant/sizes.dart';
import 'package:kalkulator_kredit/utils/shared_widgets/score_indikator.dart';

class HasilAnalisaScreen extends StatelessWidget {
  const HasilAnalisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final logic = Get.find<CalculatorLogic>();
    final score = logic.creditScoreUser.toInt();

    Color _getRiskColor(int score) {
      if (score <= 607) return Colors.red;
      if (score <= 665) return TColors.secondaryColor;
      if (score <= 685) return TColors.secondaryColor;
      if (score <= 704) return TColors.primaryColor;
      return TColors.primaryColor;
    }

    IconData _getActionIcon(String action) {
      if (action == TScore.reject) return Icons.cancel_outlined;
      if (action == TScore.veryLowRisk ||
          action == TScore.a2 ||
          action == TScore.a1) return Icons.check_circle_outline;
      return Icons.info_outline;
    }

    Color _getActionColor(String action) {
      if (action == TScore.reject) return Colors.red.shade600;
      return TColors.primaryColor;
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: TColors.primaryColor,
        elevation: 0,
        title: Text(
          'Analisa Kredit',
          style: textTheme.titleLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(TSizes.spaceBtwSections),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text("Skor Kredit Anda",
                        style: textTheme.titleMedium
                            ?.copyWith(color: Colors.grey)),
                    const SizedBox(height: 16),
                    ScoreIndikator(score: score, size: 220),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Obx(() {
                final riskColor = _getRiskColor(score);
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: riskColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.assessment_outlined,
                              color: riskColor, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tingkat Risiko',
                                  style: textTheme.titleSmall
                                      ?.copyWith(color: Colors.grey.shade600)),
                              const SizedBox(height: 4),
                              Text(
                                '${logic.kodeRisikoUser.value} - ${logic.namaRisikoUser.value}',
                                style: textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: riskColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 24),
              Obx(() {
                final action = logic.actionUser.value;
                final actionColor = _getActionColor(action);
                final actionIcon = _getActionIcon(action);

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: actionColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: actionColor.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(actionIcon, color: Colors.white, size: 48),
                      const SizedBox(height: 16),
                      Text(
                        'HASIL KEPUTUSAN',
                        style: textTheme.labelLarge?.copyWith(
                            color: Colors.white.withOpacity(0.8),
                            letterSpacing: 1.2),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        action.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0),
                child: const Text("Selesai"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
