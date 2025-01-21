import 'package:evanly/core/theme/app_theme_mangment.dart';
import 'package:flutter/material.dart';
import 'core/routes/pageRouts.dart';
import 'core/routes/routs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // important before run app must this function called first
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRouteName.splach, // نقطة البداية
      onGenerateRoute: AppRoutes.onGeneratedRoute,
    );
  }
}
