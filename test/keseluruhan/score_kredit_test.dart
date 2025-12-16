import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_kredit/utils/constant/score.dart';
import 'package:kalkulator_kredit/utils/functions/my_helper_function.dart';

void main() {
  group('Score keseluruhan', () {
    test(
      'test total score',
      () {
        expect(
            ScoreKredit.totalScore(
                totalKategori1: 10,
                totalKategori2: 18,
                totalKategori3: -79),
            567);
      },
    );
    test(
      'test risk grade',
      () {
        expect(
            ScoreKredit.riskGrade(totalScore: 567),
            'E2');
      },
    );

  });
}
