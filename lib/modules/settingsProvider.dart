import 'package:flutter/material.dart';

class settings_Provider extends ChangeNotifier{
  List<String> languages = [ "English", "عربي"];
  List<String> themes = [ "Light", "Dark"];
  List<String> get allLanguages => languages;
  List<String> get themeMode1 => themes;
  // observer Disagn pattern
  String Current_Languge = "en";
  setNewLanguge(String languge){
    if(languge == Current_Languge) return;
    Current_Languge = languge;
    notifyListeners();
  }
  ThemeMode Current_Theme = ThemeMode.light;
  setNewTheme(ThemeMode theme){
    if(theme == Current_Theme) return;
    Current_Theme = theme;
    notifyListeners();
  }
  bool isDark (){
    return Current_Theme == ThemeMode.dark;
  }
}