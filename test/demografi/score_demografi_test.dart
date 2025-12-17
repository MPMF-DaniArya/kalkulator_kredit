import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_kredit/utils/constant/score.dart';
import 'package:kalkulator_kredit/utils/functions/my_helper_function.dart';

void main() {
  // maingroup(
  //   'Score usia test',
  //   () {
  //     test(
  //       'Umur 19-25 harus outputnya -9',
  //       () {
  //         expect(Demografi.scoreUsia(umurUser: 19), -9);
  //         expect(Demografi.scoreUsia(umurUser: 22), -9);
  //         expect(Demografi.scoreUsia(umurUser: 25), -9);
  //       },
  //     );
  //
  //     test(
  //       'Umur 26-34 harus outputnya -3',
  //       () {
  //         expect(Demografi.scoreUsia(umurUser: 26), -3);
  //         expect(Demografi.scoreUsia(umurUser: 30), -3);
  //         expect(Demografi.scoreUsia(umurUser: 34), -3);
  //       },
  //     );
  //     test(
  //       'Umur 35-54 harus outputnya 5',
  //       () {
  //         expect(Demografi.scoreUsia(umurUser: 35), 5);
  //         expect(Demografi.scoreUsia(umurUser: 45), 5);
  //         expect(Demografi.scoreUsia(umurUser: 54), 5);
  //       },
  //     );
  //     test(
  //       'Umur 55 keatas harus outputnya 14',
  //       () {
  //         expect(Demografi.scoreUsia(umurUser: 55), 14);
  //         expect(Demografi.scoreUsia(umurUser: 65), 14);
  //         expect(Demografi.scoreUsia(umurUser: 80), 14);
  //       },
  //     );
  //     test(
  //       'Umur dibawah 19 harus outputnya null',
  //       () {
  //         expect(Demografi.scoreUsia(umurUser: 18), null);
  //         expect(Demografi.scoreUsia(umurUser: 10), null);
  //         expect(Demografi.scoreUsia(umurUser: 0), null);
  //       },
  //     );
  //   },
  // );
  //
  // group('Score maritial status test', () {
  //   test(
  //     'Jika telah menikah outputnya harus 6',
  //     () {
  //       expect(
  //           Demografi.scoreMaritialStatus(maritialStatus: TScore.menikah), 6);
  //     },
  //   );
  //   test(
  //     'Jika masih single outputnya harus 0',
  //     () {
  //       expect(Demografi.scoreMaritialStatus(maritialStatus: TScore.single), 0);
  //     },
  //   );
  //   test(
  //     'Jika duda/janda outputnya harus -14',
  //     () {
  //       expect(
  //           Demografi.scoreMaritialStatus(maritialStatus: TScore.dudaOrJanda),
  //           -14);
  //     },
  //   );
  // });
  //
  // group(
  //   'Score Home Status',
  //   () {
  //     test(
  //       'Jika sendiri outputnya harus 5',
  //       () {
  //         expect(Demografi.scoreHomeStatus(homeStatus: TScore.sendiri), 5);
  //       },
  //     );
  //     test(
  //       'Jika orang tua outputnya harus -2',
  //       () {
  //         expect(Demografi.scoreHomeStatus(homeStatus: TScore.orangTua), -2);
  //       },
  //     );
  //     test(
  //       'Jika keluarga outputnya harus -4',
  //       () {
  //         expect(Demografi.scoreHomeStatus(homeStatus: TScore.keluarga), -4);
  //       },
  //     );
  //     test(
  //       'Jika kontrak/kost outputnya harus -4',
  //       () {
  //         expect(
  //             Demografi.scoreHomeStatus(homeStatus: TScore.kontrakOrKost), -4);
  //       },
  //     );
  //     test(
  //       'Jika perusahaan outputnya harus 2',
  //       () {
  //         expect(Demografi.scoreHomeStatus(homeStatus: TScore.perusahaan), 2);
  //       },
  //     );
  //   },
  // );
  //
  // group(
  //   'Score pekerjaan',
  //   () {
  //     test(
  //       'Jika employee outputnya harus 10',
  //       () {
  //         expect(Demografi.scorePekerjaan(pekerjaanUser: TScore.employee), 10);
  //       },
  //     );
  //     test(
  //       'Jika entrepreneur outputnya harus 0',
  //       () {
  //         expect(
  //             Demografi.scorePekerjaan(pekerjaanUser: TScore.entrepreneur), 0);
  //       },
  //     );
  //     test(
  //       'Jika Professional outputnya harus -4',
  //       () {
  //         expect(
  //             Demografi.scorePekerjaan(pekerjaanUser: TScore.professional), -4);
  //       },
  //     );
  //   },
  // );
  //
  // group(
  //   'Score lama kerja',
  //   () {
  //     test(
  //       'Jika lama kerja 0-1 tahun outputnya harus 0',
  //       () {
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2025), 0);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2024), 0);
  //       },
  //     );
  //     test(
  //       'Jika lama kerja 2-4 tahun outputnya harus -4',
  //       () {
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2023), -4);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2022), -4);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2021), -4);
  //       },
  //     );
  //     test(
  //       'Jika lama kerja 5-9 tahun outputnya harus -2',
  //       () {
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2020), -2);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2019), -2);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2018), -2);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2017), -2);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2016), -2);
  //       },
  //     );
  //     test(
  //       'Jika lama kerja 10-14 tahun outputnya harus 4',
  //       () {
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2015), 4);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2014), 4);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2013), 4);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2012), 4);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2011), 4);
  //       },
  //     );
  //     test(
  //       'Jika lama kerja lebih 15 tahun outputnya harus 7',
  //       () {
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2010), 7);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2009), 7);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2005), 7);
  //       },
  //     );
  //     test(
  //       'Jika lama tidak valid outputnya harus null',
  //       () {
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2026), null);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2027), null);
  //         expect(Demografi.scoreLamaKerja(tahunAwalKerja: 2028), null);
  //       },
  //     );
  //   },
  // );

  group(
    'Test keseluruhan',
    () {
      test(
        'Test 10',
        () {
          expect(
              Demografi.scoreKeseluruhanDemografi(
                  scoreUsia: -3,
                  scoreMaritialStatus: 0,
                  scoreHomeStatus: 5,
                  scorePekerjaan: 10,
                  scoreLamaKerja: 7),
              19);
        },
      );
    },
  );
}
