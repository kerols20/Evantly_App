import 'package:evanly/core/routes/pageRouts.dart';
import 'package:evanly/modules/create_Evant/create_Evant.dart';
import 'package:evanly/modules/create_Evant/widget_selcetd-tab.dart';
import 'package:evanly/modules/homeScreen/layout_Home.dart';
import 'package:evanly/modules/signIn/creat_Account.dart';
import 'package:evanly/modules/signIn/rePassword.dart';
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
      case PagesRouteName.CreateEvant:
        return MaterialPageRoute(
          builder: (context) => create_Evant(),
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
      case PagesRouteName.Creat_Account:
        return MaterialPageRoute(
          builder: (context) => CreatAccount(),
          settings: settings,
        );
      case PagesRouteName.RePassword:
        return MaterialPageRoute(
          builder: (context) => rePassword(),
          settings: settings,
        );
      case PagesRouteName.layoutHome:
        return MaterialPageRoute(
          builder: (context) => LayoutHome(),
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
