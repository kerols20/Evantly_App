import 'package:bot_toast/bot_toast.dart';
import 'package:evanly/core/services/loading_services.dart';
import 'package:evanly/core/theme/app_theme_mangment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  // here we must celled it after run app and use Easyloding in any place in app
  Services_loading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRouteName.splach, // نقطة البداية
      // here we made called EasyLoading in builder MaterialApp
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      onGenerateRoute: AppRoutes.onGeneratedRoute,
    );
  }
}
