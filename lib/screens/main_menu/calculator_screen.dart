import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_kredit/screens/main_menu/calculator_logic.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/kredit_pertanyaan_satu.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/select_brand_motor.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/select_home_status.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/select_maritial_status.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/select_pekerjaan_status.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/select_penyedia_bank.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/select_penyedia_fintech.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/select_penyedia_lainnya.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/select_penyedia_multifinance.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/select_pernah_terlambat.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/select_tenor.dart';
import 'package:kalkulator_kredit/utils/constant/score.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(CalculatorLogic());
    final state = Get.find<CalculatorLogic>().state;
    final textTheme = Theme.of(context).textTheme;
    const estimasiHargaMotor = TScore.otr;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Crespo',
          style: textTheme.headlineMedium!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: GetBuilder<CalculatorLogic>(
          builder: (logic) {
            return Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                  key: state.formkey,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Demografi',
                            style: textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Text('Tanggal Lahir'),
                        OutlinedButton(
                            onPressed: () => logic.selectTanggalLahir(context),
                            child: Text(state.tanggalLahir == null
                                ? 'Masukkan tanggal lahir'
                                : "${state.tanggalLahir!.day}-${state.tanggalLahir!.month}-${state.tanggalLahir!.year}")),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text('Marital Status'),
                        OutlinedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                builder: (context) =>
                                    const SelectMaritialStatus(),
                              );
                            },
                            child: state.selectedMaritalStatus == null
                                ? const Text('Pilih Marital Status')
                                : Text(state.selectedMaritalStatus!)),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text('Home Status'),
                        OutlinedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                builder: (context) => const SelectHomeStatus(),
                              );
                            },
                            child: state.selectedHomeStatus == null
                                ? const Text('Pilih Home Status')
                                : Text(state.selectedHomeStatus!)),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text('Pekerjaan'),
                        OutlinedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) =>
                                    const SelectPekerjaanStatus(),
                              );
                            },
                            child: state.selectedPekerjaan == null
                                ? const Text('Pilih Pekerjaan')
                                : Text(state.selectedPekerjaan!)),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text('Lama kerja (dalam tahun)'),
                        TextFormField(
                          controller: state.lamaKerjaController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'contoh 2018...',
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Lama kerja tidak boleh kosong';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            state.lamaKerjaController?.text = value!;
                          },
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Divider(
                          color: Colors.green,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Asset',
                            style: textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Text('Brand Motor'),
                        OutlinedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) => const SelectBrandMotor(),
                              );
                            },
                            child: state.selectedBrandMotor == null
                                ? const Text('Pilih Brand Motor')
                                : Text(state.selectedBrandMotor!)),
                        if (state.selectedBrandMotor != null)
                          Text(
                            'Estimasi harga: ${estimasiHargaMotor[state.selectedBrandMotor]}',
                            style: textTheme.bodyMedium!
                                .copyWith(color: Colors.grey.shade700),
                          ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text('Uang Muka'),
                        TextFormField(
                          controller: state.uangMukaController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Masukkan nominal uang...',
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Nominal uang harus di isi';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            state.uangMukaController?.text = value!;
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                            'Minimal uang muka:\n- Beat = 2.200.000\n- Vario = 2.600.000\n- Scoopy = 2.500.000'),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text('Tenor (dalam bulan)'),
                        OutlinedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) => const SelectTenor(),
                              );
                            },
                            child: state.selectedTenor == null
                                ? const Text('Pilih Tenor')
                                : Text(state.selectedTenor!.toString())),
                        const Divider(
                          color: Colors.green,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'History Kredit',
                            style: textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                            'Apakah anda memiliki fasilitas kredit yang aktif?'),
                        OutlinedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) =>
                                    const KreditPertanyaanSatu(),
                              );
                            },
                            child: state.selectedPunyaKreditYangAktif == null
                                ? const Text('Pilih Jawaban')
                                : Text(state.selectedPunyaKreditYangAktif!)),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                            'Penyedia fasilitas kredit yang anda miliki?'),
                        Row(
                          children: [
                            const Text('Bank'),
                            const SizedBox(
                              width: 18,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    builder: (context) =>
                                        const SelectPenyediaBank(),
                                  );
                                },
                                child: state.selectedApakahBank == null
                                    ? const Text('Pilih Jawaban')
                                    : Text(state.selectedApakahBank!)),
                          ],
                        ),
                        Text(
                          '(kartu kredit, kredit dengan agunan, kredit tanpa agunan, KPR, dsb)',
                          style: textTheme.bodyMedium!
                              .copyWith(color: Colors.grey.shade700),
                        ),
                        Row(
                          children: [
                            const Text('Multifinance'),
                            const SizedBox(
                              width: 18,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    builder: (context) =>
                                        const SelectPenyediaMultifinance(),
                                  );
                                },
                                child: state.selectedApakahMultifinance == null
                                    ? const Text('Pilih Jawaban')
                                    : Text(state.selectedApakahMultifinance!)),
                          ],
                        ),
                        Text(
                          '(kredit kendaraan bermotor baru/bekas/dana darurat)',
                          style: textTheme.bodyMedium!
                              .copyWith(color: Colors.grey.shade700),
                        ),
                        Row(
                          children: [
                            const Text('Fintech'),
                            const SizedBox(
                              width: 18,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    builder: (context) =>
                                        const SelectPenyediaFintech(),
                                  );
                                },
                                child: state.selectedApakahFintech == null
                                    ? const Text('Pilih Jawaban')
                                    : Text(state.selectedApakahFintech!)),

                          ],
                        ),
                        Text(
                          '(Paylater)',
                          style: textTheme.bodyMedium!
                              .copyWith(color: Colors.grey.shade700),
                        ),
                        Row(
                          children: [
                            const Text('Lainnya'),
                            const SizedBox(
                              width: 18,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    builder: (context) =>
                                        const SelectPenyediaLainnya(),
                                  );
                                },
                                child: state.selectedApakahLainnya == null
                                    ? const Text('Pilih Jawaban')
                                    : Text(state.selectedApakahLainnya!)),
                          ],
                        ),
                        const SizedBox(height: 18,),
                        const Text(
                            'Apakah anda pernah mengalami keterlambatan bayar dalam 12 bulan terakhir?'),
                        OutlinedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) =>
                                const SelectPernahTerlambat(),
                              );
                            },
                            child: state.selectedPernahTerlambat == null
                                ? const Text('Pilih Jawaban')
                                : Text(state.selectedPernahTerlambat!)),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () => logic.hitungCreditScoreUser(),
                              child: const Text('Submit')),
                        ),
                        Text('Credit Score Anda', style: textTheme.titleLarge,),
                        Obx(() => Text(logic.creditScoreUser.value.toString())),
                        const SizedBox(
                          height: 32,
                        ),
                        Text('Risiko Anda', style: textTheme.titleLarge,),
                        Obx(() => Text(logic.risikoUser.value.toString())),
                        const SizedBox(
                          height: 32,
                        ),
                        Text('Action Anda', style: textTheme.titleLarge,),
                        Obx(() => Text(logic.actionUser.value)),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ])),
            );
          },
        ),
      )),
    );
  }
}
