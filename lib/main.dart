import 'package:campus_connect/firebase_options.dart';
import 'package:campus_connect/helper/hive_pref.dart';
import 'package:campus_connect/provider/saved_provider.dart';
import 'package:campus_connect/provider/theme_dark_light.dart';
import 'package:campus_connect/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Pref.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CampusConnect());
}

class CampusConnect extends StatelessWidget {
  const CampusConnect({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SavedProvider()),
        ChangeNotifierProvider(create: (_) => ThemeDarkLight()),
      ],
      child: Consumer<ThemeDarkLight>(
        builder: (context, mode, child) {
          return MaterialApp(
            themeMode: mode.themeDarkMode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(brightness: Brightness.dark),
            debugShowCheckedModeBanner: false,
            home: const Splash(),
          );
        },
      ),
    );
  }
}
