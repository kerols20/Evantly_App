import 'package:evanly/core/routes/pageRouts.dart';
import 'package:evanly/modules/signIn/signIn.dart';
import 'package:evanly/modules/splachScreen/scound_splach.dart';
import 'package:flutter/material.dart';

import '../../modules/onbording/onBording.dart';
import '../../modules/splachScreen/splachScreen.dart';
abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.splach:
        return MaterialPageRoute(
          builder: (context) => SplachScreen(),
          settings: settings,
        );
      case PagesRouteName.onboarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
          settings: settings,
        );
      case PagesRouteName.scound:
        return MaterialPageRoute(
          builder: (context) => scound_splach(),
          settings: settings,
        );
      case PagesRouteName.signIn:
        return MaterialPageRoute(
          builder: (context) => signIn(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplachScreen(), // المسار الافتراضي
          settings: settings,
        );
    }
  }
}
