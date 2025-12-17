import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_kredit/screens/main_menu/calculator_state.dart';
import 'package:kalkulator_kredit/utils/constant/score.dart';
import 'package:kalkulator_kredit/utils/functions/my_helper_function.dart';

class CalculatorLogic extends GetxController {
  final CalculatorState state = CalculatorState();
  var creditScoreUser = 0.obs;
  var risikoUser = ''.obs;
  var actionUser = ''.obs;

  void hitungCreditScoreUser() {
    final isValid = state.formkey!.currentState!.validate();
    if (!isValid) return;
    state.formkey!.currentState!.save();

    // ==========================================
    // 1. DEMOGRAFI
    // ==========================================
    if (state.tanggalLahir == null) {
      Get.snackbar('Info', 'Mohon mengisi tanggal lahir');
      return;
    }

    int umurUser = Demografi.usia(tanggalLahir: state.tanggalLahir!);
    int? scoreUsiaUser = Demografi.scoreUsia(umurUser: umurUser);

    if (scoreUsiaUser == null) {
      Get.snackbar(
          'Maaf', 'Usia Anda belum memenuhi kriteria (Min 19, Max 55+)');
      return;
    }

    if (state.selectedMaritalStatus == null ||
        state.selectedHomeStatus == null ||
        state.selectedPekerjaan == null) {
      Get.snackbar('Info', 'Mohon lengkapi data demografi');
      return;
    }

    int tahunAwalKerja = int.tryParse(state.lamaKerjaController!.text.trim()) ??
        DateTime.now().year;

    int? scoreKeseluruhanDemografi = Demografi.scoreKeseluruhanDemografi(
        scoreUsia: scoreUsiaUser,
        scoreMaritialStatus: Demografi.scoreMaritialStatus(
                maritialStatus: state.selectedMaritalStatus!) ??
            0,
        scoreHomeStatus:
            Demografi.scoreHomeStatus(homeStatus: state.selectedHomeStatus!) ??
                0,
        scorePekerjaan:
            Demografi.scorePekerjaan(pekerjaanUser: state.selectedPekerjaan!) ??
                0,
        scoreLamaKerja:
            Demografi.scoreLamaKerja(tahunAwalKerja: tahunAwalKerja) ?? 0);

    // ==========================================
    // 2. ASSET
    // ==========================================
    if (state.selectedBrandMotor == null || state.selectedTenor == null) {
      Get.snackbar('Info', 'Mohon lengkapi data asset');
      return;
    }

    int? estimasiHarga =
        Asset.estimasiHargaMotor(brandMotor: state.selectedBrandMotor!);
    if (estimasiHarga == null) {
      Get.snackbar('Error', 'Harga motor tidak ditemukan untuk brand ini');
      return;
    }

    int uangMuka =
        int.tryParse(state.uangMukaController!.text.replaceAll('.', '')) ?? 0;

    int? scoreUangMukaUser = Asset.scoreUangMuka(
        jumlahUangMuka: uangMuka, estimasiHargaMotor: estimasiHarga);

    if (scoreUangMukaUser == null) {
      Get.snackbar('Info', 'Persentase DP tidak valid');
      return;
    }

    int scoreKeseluruhanAsset = Asset.scoreKeseluruhanAsset(
        scoreUangMuka: scoreUangMukaUser,
        scoreTenor: Asset.scoreTenor(ajuanTenor: state.selectedTenor!) ?? 0,
        scoreNtf: Asset.scoreNtf(
                estimasiHargaMotor: estimasiHarga, jumlahUangMuka: uangMuka) ??
            0);

    // ==========================================
    // 3. HISTORY KREDIT
    // ==========================================
    int scoreKeseluruhanHistoryKreditUser = 0;

    bool punyaKredit = state.selectedPunyaKreditYangAktif == "1" ||
        state.selectedPunyaKreditYangAktif == "Ya";

    if (punyaKredit) {
      int check(String? val) => (val == "1" || val == "Ya") ? 1 : 0;

      int scorePenyedia = HistoryKredit.scorePenyediaFasilitasKredit(
          isBank: check(state.selectedApakahBank),
          isMultifinance: check(state.selectedApakahMultifinance),
          isFintech: check(state.selectedApakahFintech));

      int scoreFasilitas = HistoryKredit.scoreFasilitasKreditAktif(
          scorePenyediaFasilitasKredit: scorePenyedia);

      // Cek Keterlambatan
      int? scoreTelat = HistoryKredit.scoreKeterlambatanBayar(
          isTerlambat: check(state.selectedPernahTerlambat));

      scoreKeseluruhanHistoryKreditUser =
          HistoryKredit.scoreKeseluruhanHistoryKreditAktif(
              scoreFasilitasKreditAktif: scoreFasilitas,
              scoreKeterlambatanBayar: scoreTelat ?? 0);
    } else {
      scoreKeseluruhanHistoryKreditUser =
          HistoryKredit.scoreKeseluruhanHistoryKreditTidakAktif();
    }

    // Hitung Total
    int finalScore = ScoreKredit.totalScore(
        totalKategori1: scoreKeseluruhanDemografi,
        totalKategori2: scoreKeseluruhanAsset,
        totalKategori3: scoreKeseluruhanHistoryKreditUser);

    String finalGrade = ScoreKredit.riskGrade(totalScore: finalScore);

    creditScoreUser.value = finalScore;
    risikoUser.value = finalGrade;
    String? action = TScore.kategoriRisk[finalGrade];
    actionUser.value = finalGrade == TScore.a2 || finalGrade == TScore.a1
        ? TScore.kategoriAction[finalGrade]!
        : TScore.kategoriAction[action]! ?? 'Action tidak diketahui';
    update();
  }

  Future<void> selectTanggalLahir(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: state.tanggalLahir ?? DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime(2006),
    );
    if (picked != null && picked != state.tanggalLahir) {
      state.tanggalLahir = picked;
      update();
    }
  }
}
