import 'package:kalkulator_kredit/utils/constant/score.dart';

class MyHelperFunction {
  static int? scoreUsia({required int umurUser}) {
    if (umurUser >= 19 && umurUser <= 25) {
      return -9;
    } else if (umurUser >= 26 && umurUser <= 34) {
      return -3;
    } else if (umurUser >= 35 && umurUser <= 54) {
      return 5;
    } else if (umurUser >= 55) {
      return 14;
    }
    return null;
  }

  static int? scoreMaritialStatus({required String maritialStatus}) {
    const status = TScore.scoreMaritialStatus;

    return status[maritialStatus];
  }
}
