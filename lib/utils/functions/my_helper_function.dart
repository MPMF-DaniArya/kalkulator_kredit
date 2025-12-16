import 'package:age_calculator/age_calculator.dart';
import 'package:kalkulator_kredit/utils/constant/score.dart';

class Demografi {
  static int usia({required DateTime tanggalLahir}) {
    DateDuration duration = AgeCalculator.age(tanggalLahir);
    return duration.years;
  }

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

  static int? scoreHomeStatus({required String homeStatus}) {
    const status = TScore.homeStatus;

    return status[homeStatus];
  }

  static int? scorePekerjaan({required String pekerjaanUser}) {
    const pekerjaan = TScore.pekerjaan;

    return pekerjaan[pekerjaanUser];
  }

  static int? scoreLamaKerja({required int tahunAwalKerja}) {
    int lamaKerja = DateTime.now().year - tahunAwalKerja;

    if (lamaKerja >= 0 && lamaKerja <= 1) {
      return 0;
    } else if (lamaKerja >= 2 && lamaKerja <= 4) {
      return -4;
    } else if (lamaKerja >= 5 && lamaKerja <= 9) {
      return -2;
    } else if (lamaKerja >= 10 && lamaKerja <= 14) {
      return 4;
    } else if (lamaKerja >= 15) {
      return 7;
    }

    return null;
  }

  static int scoreKeseluruhanDemografi(
      {required int scoreUsia,
      required int scoreMaritialStatus,
      required int scoreHomeStatus,
      required int scorePekerjaan,
      required int scoreLamaKerja}) {
    return scoreUsia +
        scoreMaritialStatus +
        scoreHomeStatus +
        scorePekerjaan +
        scoreLamaKerja;
  }
}

class Asset {
  static int? estimasiHargaMotor({required String brandMotor}) {
    const otr = TScore.otr;

    return otr[brandMotor];
  }

  static int? scoreUangMuka(
      {required int jumlahUangMuka, required int estimasiHargaMotor}) {
    double uangMukaDalamPersen = (jumlahUangMuka / estimasiHargaMotor) * 100;

    if (uangMukaDalamPersen >= 0 && uangMukaDalamPersen <= 10) {
      return -4;
    } else if (uangMukaDalamPersen >= 11 && uangMukaDalamPersen <= 15) {
      return -2;
    } else if (uangMukaDalamPersen >= 16 && uangMukaDalamPersen <= 30) {
      return 15;
    } else if (uangMukaDalamPersen >= 31 && uangMukaDalamPersen <= 65) {
      return 22;
    } else if (uangMukaDalamPersen >= 66) {
      return 28;
    }

    return null;
  }

  static int? scoreTenor({required int ajuanTenor}) {
    const tenor = TScore.tenor;

    return tenor[ajuanTenor];
  }

  static int? scoreNtf(
      {required int estimasiHargaMotor, required int jumlahUangMuka}) {
    int ntf = estimasiHargaMotor - jumlahUangMuka;

    if (ntf >= 0 && ntf <= 16000000) {
      return 16;
    } else if (ntf > 16000000 && ntf <= 17500000) {
      return 4;
    } else if (ntf > 17500000 && ntf <= 22000000) {
      return -2;
    } else if (ntf > 22000000) {
      return -5;
    }

    return null;
  }

  static int scoreKeseluruhanAsset(
      {required int scoreUangMuka,
      required int scoreTenor,
      required int scoreNtf}) {
    return scoreUangMuka + scoreTenor + scoreNtf;
  }
}

class HistoryKredit {
  static int scorePenyediaFasilitasKredit(
      {required int isBank,
      required int isMultifinance,
      required int isFintech}) {
    int bank = isBank == 1 ? -7 : 0;
    int multifinance = isMultifinance == 1 ? -8 : 0;
    int fintech = isFintech == 1 ? -21 : 0;
    int lainnya = 0;

    return bank + multifinance + fintech + lainnya;
  }

  static int? scoreKeterlambatanBayar({required int isTerlambat}) {
    return isTerlambat == 1 ? -41 : 60;
  }

  static int scoreFasilitasKreditAktif(
      {required int scorePenyediaFasilitasKredit}) {
    return -2 + scorePenyediaFasilitasKredit;
  }

  static int scoreKeseluruhanHistoryKreditTidakAktif() {
    return 46;
  }

  static int scoreKeseluruhanHistoryKreditAktif(
      {required int scoreFasilitasKreditAktif,
      required int scoreKeterlambatanBayar}) {
    return scoreFasilitasKreditAktif + scoreKeterlambatanBayar;
  }
}

class ScoreKredit {
  static int totalScore(
      {required int totalKategori1,
      required int totalKategori2,
      required int totalKategori3}) {
    return 612 + totalKategori1 + totalKategori2 + totalKategori3 + 6;
  }

  static String riskGrade({required int totalScore}) {
    if (totalScore < 537) {
      return 'E3';
    }
    if (totalScore < 607) {
      return 'E2';
    }
    if (totalScore < 636) {
      return 'E1';
    }
    if (totalScore < 654) {
      return 'D3';
    }
    if (totalScore < 665) {
      return 'D2';
    }
    if (totalScore < 673) {
      return 'D1';
    }
    if (totalScore < 679) {
      return 'C3';
    }
    if (totalScore < 685) {
      return 'C2';
    }
    if (totalScore < 692) {
      return 'C1';
    }
    if (totalScore < 698) {
      return 'B3';
    }
    if (totalScore < 704) {
      return 'B2';
    }
    if (totalScore < 711) {
      return 'B1';
    }
    if (totalScore < 719) {
      return 'A3';
    }
    if (totalScore < 737) {
      return 'A2';
    } else {
      return 'A1';
    }
  }
}
