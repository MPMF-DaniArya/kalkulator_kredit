import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_kredit/utils/constant/score.dart';
import 'package:kalkulator_kredit/utils/functions/my_helper_function.dart';

void main() {
  group(
    'Test estimasi harga motor',
    () {
      test(
        'test semua motor',
        () {
          expect(Asset.estimasiHargaMotor(brandMotor: TScore.beat), 22000000);
          expect(Asset.estimasiHargaMotor(brandMotor: TScore.vario), 26000000);
          expect(Asset.estimasiHargaMotor(brandMotor: TScore.scoopy), 25000000);
        },
      );

      test(
        'test uang muka 0-10%',
        () {
          expect(
              Asset.scoreUangMuka(
                  jumlahUangMuka: 5000000, estimasiHargaMotor: 22000000),
              15);
        },
      );

      test(
        'Test tenor',
        () {
          expect(Asset.scoreTenor(ajuanTenor: 24), -1);
          expect(Asset.scoreTenor(ajuanTenor: 12), 32);
          expect(Asset.scoreTenor(ajuanTenor: 36), -9);
          expect(Asset.scoreTenor(ajuanTenor: 48), -26);
        },
      );
      test(
        'Test ntf',
        () {
          expect(
              Asset.scoreNtf(
                  estimasiHargaMotor: 22000000, jumlahUangMuka: 5000000),
              4);
        },
      );
      test(
        'Test keseluruhan',
        () {
          expect(
              Asset.scoreKeseluruhanAsset(
                  scoreUangMuka: 15, scoreTenor: -1, scoreNtf: 4),
              18);
        },
      );
    },
  );
}
