import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_kredit/utils/constant/colors.dart';

import '../../screens/main_menu/calculator_logic.dart';

class ScoreIndikator extends StatelessWidget {
  final int score;
  final double maxScore;
  final double size;

  const ScoreIndikator({
    super.key,
    required this.score,
    this.maxScore = 737,
    this.size = 300,
  });

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CalculatorLogic>();

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: GaugePainter(
              percent: score / maxScore,
              progressColor: logic.creditScoreUser <= 607
                  ? Colors.red
                  : logic.creditScoreUser <= 665
                      ? TColors.secondaryColor
                      : logic.creditScoreUser <= 685
                          ? Colors.yellow
                          : logic.creditScoreUser <= 704
                              ? Colors.green.shade500
                              : TColors.primaryColor,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score.toString(),
                style: TextStyle(
                  fontSize: size * 0.25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double percent;
  final Color progressColor;
  final Color backgroundColor;

  GaugePainter({
    required this.percent,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    double startAngle = 135 * (pi / 180);
    double sweepAngle = 270 * (pi / 180);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    double progressSweep = sweepAngle * percent;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressSweep,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
