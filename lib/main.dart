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
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRouteName.splach, // نقطة البداية
      onGenerateRoute: AppRoutes.onGeneratedRoute,
    );
  }
}
