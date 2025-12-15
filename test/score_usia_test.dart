import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_kredit/utils/functions/my_helper_function.dart';

void main() {
  group(
    'Score Usia Test',
    () {
      test(
        'Umur 19-25 harus outputnya -9',
        () {
          expect(MyHelperFunction.scoreUsia(umurUser: 19), -9);
          expect(MyHelperFunction.scoreUsia(umurUser: 22), -9);
          expect(MyHelperFunction.scoreUsia(umurUser: 25), -9);
        },
      );

      test(
        'Umur 26-34 harus outputnya -3',
        () {
          expect(MyHelperFunction.scoreUsia(umurUser: 26), -3);
          expect(MyHelperFunction.scoreUsia(umurUser: 30), -3);
          expect(MyHelperFunction.scoreUsia(umurUser: 34), -3);
        },
      );
      test(
        'Umur 35-54 harus outputnya 5',
        () {
          expect(MyHelperFunction.scoreUsia(umurUser: 35), 5);
          expect(MyHelperFunction.scoreUsia(umurUser: 45), 5);
          expect(MyHelperFunction.scoreUsia(umurUser: 54), 5);
        },
      );
      test(
        'Umur 55 keatas harus outputnya 14',
        () {
          expect(MyHelperFunction.scoreUsia(umurUser: 55), 14);
          expect(MyHelperFunction.scoreUsia(umurUser: 65), 14);
          expect(MyHelperFunction.scoreUsia(umurUser: 80), 14);
        },
      );
      test(
        'Umur dibawah 19 harus outputnya null',
        () {
          expect(MyHelperFunction.scoreUsia(umurUser: 18), null);
          expect(MyHelperFunction.scoreUsia(umurUser: 10), null);
          expect(MyHelperFunction.scoreUsia(umurUser: 0), null);
        },
      );
    },
  );
}
