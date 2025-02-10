import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_icons.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/Custom_Elvated_Buttom.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/core/utils/firebaseFunction.dart';
import 'package:evanly/modules/create_Evant/widget_selcetd-tab.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
import 'package:evanly/modules/homeScreen_tabs/widgets/Catrgroy_Card.dart';
import 'package:evanly/modules/settingsProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<EvantCatrory> evantCategories = [
    EvantCatrory(evantCategoryName: "BookClub", evantCategoryIcon: Icons.menu_book_rounded,
        evantCategoryImage: app_images.BookClubIamge),
    EvantCatrory(evantCategoryName: "Sports", evantCategoryIcon: Icons.directions_bike,
        evantCategoryImage: app_images.SportsImage),
    EvantCatrory(evantCategoryName: "Holiday", evantCategoryIcon: Icons.view_comfortable,
        evantCategoryImage: app_images.HolidayImage)
  ];
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var provider = Provider.of<settings_Provider>(context);
    var local = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: app_color.appColorGeneral,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                )
            ),
            height: mediaQuery.size.height * 0.22,
            width: double.infinity,
            child: SafeArea(
              child: DefaultTabController(
                length: evantCategories.length,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.05),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Welcome Back ✨", style: TextStyle(
                                fontSize: mediaQuery.size.width * 0.04,
                                color: app_color.appColorsWhite,
                              )),
                              SizedBox(height: mediaQuery.size.height * 0.005),
                              Text("Kerolos Adel", style: TextStyle(
                                fontSize: mediaQuery.size.width * 0.06,
                                fontWeight: FontWeight.bold,
                                color: app_color.appColorsWhite,
                              )),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              provider.setNewTheme(provider.isDark() ? ThemeMode.light : ThemeMode.dark);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(mediaQuery.size.width * 0.02),
                              child: ImageIcon(AssetImage(icons_app.SunIcon), color: app_color.appColorsWhite),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(mediaQuery.size.width * 0.02),
                            child: CustomElvatedButtom(text: 'EN', borderRudis: 25),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.size.width * 0.05),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: app_color.appColorsWhite),
                          SizedBox(width: mediaQuery.size.width * 0.02),
                          Text("Cairo, Egypt", style: TextStyle(
                            fontSize: mediaQuery.size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: app_color.appColorsWhite,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: mediaQuery.size.height * 0.01),
                    TabBar(
                      onTap: (index) {
                        setState(() {
                          selectedTab = index;
                        });
                      },
                      indicatorColor: Colors.transparent,
                      tabs: evantCategories.map((category) {
                        return Tab(
                          child: Container(
                            padding: EdgeInsets.all(mediaQuery.size.width * 0.01),
                            decoration: BoxDecoration(
                              color: selectedTab == evantCategories.indexOf(category) ? app_color.appColorsWhite : app_color.appColorGeneral,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  category.evantCategoryIcon,
                                  color: selectedTab == evantCategories.indexOf(category) ? app_color.appColorGeneral : app_color.appColorsWhite,
                                ),
                                SizedBox(width: mediaQuery.size.width * 0.02),
                                Text(
                                  category.evantCategoryName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: selectedTab == evantCategories.indexOf(category) ? app_color.appColorGeneral : app_color.appColorsWhite
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<EventDataModel>>(
              stream: firebasefunction().RealStreemDats(evantCategories[selectedTab].evantCategoryName),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                List<EventDataModel> eventList = snapshot.data!.docs.map((e) => e.data()).toList();
                return eventList.isEmpty
                    ? Center(child: Text("No Events Available"))
                    : ListView.separated(
                  padding: EdgeInsets.all(mediaQuery.size.width * 0.05),
                  itemBuilder: (context, index) => CatrgroyCard(model: eventList[index]),
                  separatorBuilder: (context, index) => SizedBox(height: mediaQuery.size.height * 0.02),
                  itemCount: eventList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
