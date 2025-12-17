import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator_kredit/screens/main_menu/calculator_logic.dart';
import 'package:kalkulator_kredit/screens/main_menu/widgets/option_sheet.dart';
import 'package:kalkulator_kredit/utils/constant/colors.dart';
import 'package:kalkulator_kredit/utils/constant/score.dart';
import 'package:kalkulator_kredit/utils/constant/sizes.dart';
import 'package:kalkulator_kredit/utils/shared_widgets/button_radius_eight.dart';
import 'package:kalkulator_kredit/utils/shared_widgets/button_submit.dart';
import 'package:kalkulator_kredit/utils/shared_widgets/my_input_text.dart';
import 'package:kalkulator_kredit/utils/shared_widgets/option_button.dart';

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
    print(logic.creditScoreUser.value);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [TColors.primaryColor, Colors.white],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.009, 0.95])),
        child: SafeArea(child: SingleChildScrollView(
          child: GetBuilder<CalculatorLogic>(
            builder: (logic) {
              return Padding(
                padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                child: Form(
                    key: state.formkey,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: TSizes.largeSpace,
                                horizontal: TSizes.spaceBtwSections),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(TSizes.spaceBtwItems),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    'Mari mulai dengan data diri Anda.',
                                    style: textTheme.headlineMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwSections,
                                ),
                                Text(
                                  'Tanggal Lahir',
                                  style: textTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: TSizes.smallSpace,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ButtonRadiusEight(textTheme,
                                      bgColor:
                                          TColors.primaryColor.withOpacity(0.7),
                                      textColor: Colors.white,
                                      child: Text(
                                        state.tanggalLahir == null
                                            ? 'Masukkan tanggal lahir'
                                            : "${state.tanggalLahir!.day}-${state.tanggalLahir!.month}-${state.tanggalLahir!.year}",
                                        style: textTheme.bodyMedium!.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () =>
                                          logic.selectTanggalLahir(context)),
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                OptionButton(
                                  selectedOption: state.selectedMaritalStatus,
                                  bottomSheet: OptionSheet(
                                      options: TScore.maritialStatusList,
                                      selectedValue:
                                          state.selectedMaritalStatus,
                                      title: 'Pilih Maritial Status',
                                      onSelect: (value) {
                                        state.selectedMaritalStatus = value;
                                        logic.update();
                                      }),
                                  label: 'Maritial Status',
                                  textTheme: textTheme,
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                OptionButton(
                                    selectedOption: state.selectedHomeStatus,
                                    bottomSheet: OptionSheet(
                                        options: TScore.homeStatusList,
                                        selectedValue: state.selectedHomeStatus,
                                        title: 'Pilih Home Status',
                                        onSelect: (value) {
                                          state.selectedHomeStatus = value;
                                          logic.update();
                                        }),
                                    label: 'Home Status',
                                    textTheme: textTheme),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                OptionButton(
                                    selectedOption: state.selectedPekerjaan,
                                    bottomSheet: OptionSheet(
                                        options: TScore.pekerjaanList,
                                        selectedValue: state.selectedPekerjaan,
                                        title: 'Pilih Pekerjaan',
                                        onSelect: (value) {
                                          state.selectedPekerjaan = value;
                                          logic.update();
                                        }),
                                    label: 'Pekerjaan',
                                    textTheme: textTheme),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                Text('Lama kerja (Tahun)',
                                    style: textTheme.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                TInputText(
                                    controller: state.lamaKerjaController,
                                    labelText: 'Contoh 2018...',
                                    inputType: TextInputType.number,
                                    onSaved: (value) {
                                      state.lamaKerjaController?.text = value!;
                                    },
                                    icon: Icons.calendar_month)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: TSizes.largeSpace,
                                horizontal: TSizes.spaceBtwSections),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(TSizes.spaceBtwItems),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    'Kendaraan apa yang Anda inginkan?',
                                    style: textTheme.headlineMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                OptionButton(
                                  selectedOption: state.selectedBrandMotor,
                                  bottomSheet: OptionSheet(
                                      options: TScore.motorList,
                                      selectedValue: state.selectedBrandMotor,
                                      title: 'Pilih Brand Motor',
                                      onSelect: (value) {
                                        state.selectedBrandMotor = value;
                                        logic.update();
                                      }),
                                  label: 'Brand Motor',
                                  textTheme: textTheme,
                                ),
                                if (state.selectedBrandMotor != null)
                                  Text(
                                    'Estimasi harga: ${estimasiHargaMotor[state.selectedBrandMotor]}',
                                    style: textTheme.bodyMedium!.copyWith(
                                        color: TColors.secondText,
                                        fontWeight: FontWeight.bold),
                                  ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                Text('Uang Muka (DP)',
                                    style: textTheme.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                TInputText(
                                    controller: state.uangMukaController,
                                    labelText: 'Masukkan nominal uang muka',
                                    inputType: TextInputType.number,
                                    maxLength: 9,
                                    onSaved: (value) {
                                      state.uangMukaController?.text = value!;
                                    },
                                    icon: Icons.monetization_on_outlined),
                                Text(
                                    'Minimal uang muka:\n- Beat = 2.200.000\n- Vario = 2.600.000\n- Scoopy = 2.500.000',
                                    style: textTheme.bodyMedium!.copyWith(
                                        color: TColors.secondText,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                OptionButton(
                                  selectedOption: state.selectedTenor != null
                                      ? state.selectedTenor.toString()
                                      : 'Pilih Tenor',
                                  bottomSheet: OptionSheet(
                                      options: TScore.tenorList,
                                      selectedValue:
                                          state.selectedTenor.toString(),
                                      title: 'Pilih Tenor',
                                      onSelect: (value) {
                                        state.selectedTenor =
                                            int.tryParse(value);
                                        logic.update();
                                      }),
                                  label: 'Tenor (Bulan)',
                                  textTheme: textTheme,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: TSizes.largeSpace,
                                horizontal: TSizes.spaceBtwSections),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    TSizes.spaceBtwItems)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    'Sedikit tentang riwayat kredit Anda.',
                                    style: textTheme.headlineMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                OptionButton(
                                  selectedOption:
                                      state.selectedPunyaKreditYangAktif,
                                  bottomSheet: OptionSheet(
                                      options: TScore.yaTidakOption,
                                      selectedValue:
                                          state.selectedPunyaKreditYangAktif,
                                      title: 'Pilih Jawaban',
                                      onSelect: (value) {
                                        state.selectedPunyaKreditYangAktif =
                                            value;
                                        logic.update();
                                      }),
                                  label:
                                      'Apakah anda memiliki fasilitas kredit yang aktif?',
                                  textTheme: textTheme,
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      'Penyedia fasilitas kredit yang anda miliki?',
                                      style: textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.bold)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text('Bank',
                                            style: textTheme.bodyMedium!)),
                                    const SizedBox(
                                      width: TSizes.spaceBtwItems,
                                    ),
                                    Expanded(
                                      child: OptionButton(
                                        selectedOption:
                                            state.selectedApakahBank,
                                        bottomSheet: OptionSheet(
                                            options: TScore.yaTidakOption,
                                            selectedValue:
                                                state.selectedApakahBank,
                                            title: 'Pilih Jawaban',
                                            onSelect: (value) {
                                              state.selectedApakahBank = value;
                                              logic.update();
                                            }),
                                        textTheme: textTheme,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Expanded(
                                        flex: 2, child: Text('Multifinance')),
                                    const SizedBox(
                                      width: TSizes.spaceBtwItems,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: OptionButton(
                                        selectedOption:
                                            state.selectedApakahMultifinance,
                                        bottomSheet: OptionSheet(
                                            options: TScore.yaTidakOption,
                                            selectedValue: state
                                                .selectedApakahMultifinance,
                                            title: 'Pilih Jawaban',
                                            onSelect: (value) {
                                              state.selectedApakahMultifinance =
                                                  value;
                                              logic.update();
                                            }),
                                        textTheme: textTheme,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Expanded(
                                        flex: 2,
                                        child: Text('Fintech (Paylater)')),
                                    const SizedBox(
                                      width: TSizes.spaceBtwItems,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: OptionButton(
                                        selectedOption:
                                            state.selectedApakahFintech,
                                        bottomSheet: OptionSheet(
                                            options: TScore.yaTidakOption,
                                            selectedValue:
                                                state.selectedApakahFintech,
                                            title: 'Pilih Jawaban',
                                            onSelect: (value) {
                                              state.selectedApakahFintech =
                                                  value;
                                              logic.update();
                                            }),
                                        textTheme: textTheme,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Expanded(
                                        flex: 2, child: Text('Lainnya')),
                                    const SizedBox(
                                      width: TSizes.spaceBtwItems,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: OptionButton(
                                        selectedOption:
                                            state.selectedApakahLainnya,
                                        bottomSheet: OptionSheet(
                                            options: TScore.yaTidakOption,
                                            selectedValue:
                                                state.selectedApakahLainnya,
                                            title: 'Pilih Jawaban',
                                            onSelect: (value) {
                                              state.selectedApakahLainnya =
                                                  value;
                                              logic.update();
                                            }),
                                        textTheme: textTheme,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                OptionButton(
                                  selectedOption: state.selectedPernahTerlambat,
                                  bottomSheet: OptionSheet(
                                      options: TScore.yaTidakOption,
                                      selectedValue:
                                          state.selectedPernahTerlambat,
                                      title: 'Pilih Jawaban',
                                      onSelect: (value) {
                                        state.selectedPernahTerlambat = value;
                                        logic.update();
                                      }),
                                  label:
                                      'Apakah anda pernah mengalami keterlambatan bayar dalam 12 bulan terakhir?',
                                  textTheme: textTheme,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwSections * 1.5,
                          ),
                          ButtonSubmit(textTheme,
                              bgColor: TColors.secondaryColor,
                              textColor: Colors.white,
                              child: [
                                Text(
                                  'Lihat Hasil',
                                  style: textTheme.titleLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                              onPressed: () => logic.hitungCreditScoreUser()),
                        ],
                      ),
                    ])),
              );
            },
          ),
        )),
      ),
    );
  }
}
