import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_kredit/utils/functions/my_helper_function.dart';

void main() {
  group('Score history kredit test', () {
    test(
      'test semua fasilitas',
      () {
        expect(
            HistoryKredit.scorePenyediaFasilitasKredit(
                isBank: -7, isMultifinance: -8, isFintech: -21),
            0);
      },
    );
    test(
      'test kredit aktif',
      () {
        expect(
            HistoryKredit.scoreFasilitasKreditAktif(
                scorePenyediaFasilitasKredit: -36),
            -38);
      },
    );
  });
}
