import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_kredit/utils/functions/my_helper_function.dart';

void main() {
  group('Score history kredit test', () {
    test(
      'test semua fasilitas',
      () {
        expect(
            HistoryKredit.scorePenyediaFasilitasKredit(
                isBank: 1, isMultifinance: 1, isFintech: 1),
            -36);
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
    test(
      'test history kredit aktif',
      () {
        expect(
            HistoryKredit.scoreKeseluruhanHistoryKreditAktif(
                scoreFasilitasKreditAktif: -38,
                scoreKeterlambatanBayar: -41),
            -79);
      },
    );
  });
}
