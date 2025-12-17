import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalkulator_kredit/splash_screen.dart';
import 'package:kalkulator_kredit/utils/constant/colors.dart';

final theme = ThemeData().copyWith(
    colorScheme: ColorScheme.fromSeed(
        seedColor: TColors.primaryColor, brightness: Brightness.light),
    textTheme: GoogleFonts.poppinsTextTheme());

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator Kredit',
      theme: theme,
      home: const SplashScreen(),
    );
  }
}
