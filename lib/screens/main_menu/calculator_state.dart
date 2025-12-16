import 'package:flutter/material.dart';

class CalculatorState {
  // variabel demografi
  GlobalKey<FormState>? formkey;
  DateTime? tanggalLahir;
  String? selectedMaritalStatus;
  String? selectedHomeStatus;
  String? selectedPekerjaan;
  TextEditingController? lamaKerjaController;

  // variabel asset
  String? selectedBrandMotor;
  TextEditingController? uangMukaController;
  int? selectedTenor;
  int? estimasiHarga;
  int? minUangMuka;

  // variabel history kredit
  String? selectedPunyaKreditYangAktif;
  String? selectedApakahBank;
  String? selectedApakahMultifinance;
  String? selectedApakahFintech;
  String? selectedApakahLainnya;

  // variabel keterlambatan bayar
  String? selectedPernahTerlambat;

  CalculatorState() {
    formkey = GlobalKey<FormState>();
    lamaKerjaController = TextEditingController();
    uangMukaController = TextEditingController();
    tanggalLahir = null;
    selectedMaritalStatus = null;
    selectedHomeStatus = null;
    selectedPekerjaan = null;
    selectedBrandMotor = null;
    selectedTenor = null;
    estimasiHarga = 0;
    minUangMuka = 0;
    selectedPunyaKreditYangAktif = null;
    selectedApakahBank = null;
    selectedApakahMultifinance = null;
    selectedApakahFintech = null;
    selectedApakahLainnya = null;
    selectedPernahTerlambat = null;
  }

  void dispose() {
    lamaKerjaController?.dispose();
    uangMukaController?.dispose();
  }
}
