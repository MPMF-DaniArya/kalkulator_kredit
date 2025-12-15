import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_kredit/utils/constant/score.dart';
import 'package:kalkulator_kredit/utils/functions/my_helper_function.dart';

void main() {
  group('Score maritial status test', () {
    test(
      'Jika telah menikah outputnya harus 6',
      () {
        expect(
            MyHelperFunction.scoreMaritialStatus(
                maritialStatus: TScore.menikah),
            6);
      },
    );
    test(
      'Jika masih single outputnya harus 0',
      () {
        expect(
            MyHelperFunction.scoreMaritialStatus(
                maritialStatus: TScore.single),
            0);
      },
    );
    test(
      'Jika duda/janda outputnya harus -14',
      () {
        expect(
            MyHelperFunction.scoreMaritialStatus(
                maritialStatus: TScore.dudaOrJanda),
            -14);
      },
    );
  });
}
