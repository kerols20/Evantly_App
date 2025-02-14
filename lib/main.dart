import 'package:bot_toast/bot_toast.dart';
import 'package:evanly/core/services/loading_services.dart';
import 'package:evanly/core/theme/app_theme_mangment.dart';
import 'package:evanly/modules/settingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'core/routes/pageRouts.dart';
import 'core/routes/routs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // important before run app must this function called first
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ChangeNotifierProvider(
    create: (context) => settings_Provider(),
    child: MyApp(),),);
  // here we must celled it after run app and use Easyloding in any place in app
  Services_loading();
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<settings_Provider>(context);
    return MaterialApp(
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: Provider.of<settings_Provider>(context).Current_Theme,
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRouteName.splach, // نقطة البداية
      // here we made called EasyLoading in builder MaterialApp
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settings.Current_Languge == "ar" ? "ar" : "en"),

    );
  }
}
