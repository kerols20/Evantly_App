import 'package:evanly/core/theme/app_theme_mangment.dart';
import 'package:flutter/material.dart';
import 'core/routes/pageRouts.dart';
import 'core/routes/routs.dart';

void main() {
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
