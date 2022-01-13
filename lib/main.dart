import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/private_keys.dart';
import 'package:timberr/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://wzicmnwevvqgzttnmvou.supabase.co',
    anonKey: supabaseAnonKey,
  );
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const TimberrApp());
}

class TimberrApp extends StatelessWidget {
  const TimberrApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timberr Furniture Store',
      theme: ThemeData(
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
        appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF303030),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: const Color(0xFF303030),
          ),
        ),
      ),
      home: const Wrapper(),
    );
  }
}
