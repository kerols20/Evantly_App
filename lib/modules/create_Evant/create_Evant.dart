import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/evant_map/evant_map.dart';
import 'package:evanly/core/extensions/Custom_Elvated_Buttom.dart';
import 'package:evanly/core/extensions/custom_form_Filed.dart';
import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/core/routes/pageRouts.dart';
import 'package:evanly/core/services/sanck_bar_services.dart';
import 'package:evanly/core/utils/firebaseFunction.dart';
import 'package:evanly/modules/create_Evant/widget_selcetd-tab.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
import 'package:evanly/modules/homeScreen_tabs/widgets/button_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';


class create_Evant extends StatefulWidget {
   create_Evant({super.key});
  @override
  State<create_Evant> createState() => _create_EvantState();
}

class _create_EvantState extends State<create_Evant> {
  final GlobalKey<FormState> formKey = GlobalKey <FormState>();
  final _TitleControl = TextEditingController();
  final _descreption = TextEditingController();
  int seletTap = 0;
  DateTime? selectedData;
List<EvantCatrory> EvantCatroryListViwe = [
  EvantCatrory(evantCategoryName: "BookClub", evantCategoryIcon: Icons.menu_book_rounded,
      evantCategoryImage: app_images.BookClubIamge),
  EvantCatrory(evantCategoryName: "Sports", evantCategoryIcon: Icons.directions_bike,
      evantCategoryImage: app_images.SportsImage),
  EvantCatrory(evantCategoryName: "holiday", evantCategoryIcon: Icons.view_comfortable,
      evantCategoryImage: app_images.HolidayImage)


];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
               Padding(
                 padding:  EdgeInsets.only(right: 130),
                 child: Text("Create Evant",style: TextStyle(
                  fontSize: 22,
                   color: app_color.appColorGeneral
                 ),),
               ),
            ],
          )

        ],
      ),
      body: Form(
        key: formKey,
        child: DefaultTabController(
          length: 5,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Image.asset(EvantCatroryListViwe[seletTap].evantCategoryImage, fit: BoxFit.cover,),
              ),
              DefaultTabController(
                length: 5, // عدد التابات
                child: Column(
                  children: [
                    TabBar(
                      onTap: (index) {
                        setState(() {
                          seletTap = index; // تحديث التاب المختار
                        });
                      },
                      indicatorColor: Colors.transparent, // إخفاء المؤشر الأساسي
                      labelColor: Colors.white, // لون النص عند التحديد
                      unselectedLabelColor: Colors.grey, // لون النص عندما لا يكون محددًا
                      tabs: EvantCatroryListViwe.asMap().entries.map((entry) {
                        int index = entry.key;
                        var category = entry.value;
                        return Tab(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: seletTap == index ? app_color.appColorGeneral : app_color.appColorsWhite, // لون الخلفية حسب التحديد
                              borderRadius: BorderRadius.circular(12), // تدوير الحواف
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  category.evantCategoryIcon,
                                  color: seletTap == index ? app_color.appColorsWhite : app_color.appColorGeneral, // لون الأيقونة
                                ),
                                SizedBox(width: 8),
                                Text(
                                  category.evantCategoryName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: seletTap == index ? app_color.appColorsWhite : app_color.appColorGeneral // لون النص
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
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 330),
                    child: Text("Title", style: TextStyle(
                      color: app_color.appColorsecound,
                      fontSize: 18,
                    )
                    ),
                  ),
                  CustomFormField(
                    controller: _TitleControl,
                    labelText: '', hintText: 'what are you want do', prefixIcon: Icons.edit_note,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 290),
                    child: Text("Description", style: TextStyle(
                      color: app_color.appColorsecound,
                      fontSize: 18,
                    )
                    ),
                  ),
                  CustomFormField(
                    controller: _descreption,
                    labelText: '', hintText: 'Evant Description',
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: app_color.appColorsecound,
                      ),
                      8.spaceHorzintail,
                      Text("Event Date", style: TextStyle(
                        color: app_color.appColorsecound,
                        fontSize: 18,
                      )
                      ),
                      170.spaceHorzintail,
                      GestureDetector(
                        onTap: () {
                          ///xxxx///x//x//x/xx/x/x/x/x/
                          SelectedDateToShow(context);
                        },
                        child: Text(  selectedData!= null ? DateFormat("dd MMM yyy").format(selectedData!) : 'Choose Data', style: TextStyle(
                          color: app_color.appColorGeneral,
                          fontSize: 18,
                        )
                        ),
                      ),
                    ],
                  ),
                  10.spaceVertcial,
                  Row(
                    children: [
                      Icon(Icons.access_time_filled, color: app_color.appColorsecound,
                      ),
                      8.spaceHorzintail,
                      Text("Event time", style: TextStyle(
                        color: app_color.appColorsecound,
                        fontSize: 18,
                      )
                      ),
                      170.spaceHorzintail,
                      GestureDetector(
                        onTap: () {
                          ///xxxxxxxxxxxxxxxxxxxxxxxxx////////////
                        },
                        child: Text('choose time', style: TextStyle(
                          color: app_color.appColorGeneral,
                          fontSize: 18,
                        )
                        ),
                      ),
                    ],
                  ),
                  5.spaceVertcial,
                  Padding(
                    padding: const EdgeInsets.only(right: 330),
                    child: Text("loction", style: TextStyle(
                      color: app_color.appColorsecound,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                    ),
                  ),
                  10.spaceVertcial,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: () {
                      context.navigateTo(EvantMap());
                    },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        )),
                        minimumSize: WidgetStatePropertyAll(Size(40,70)),
                        side:WidgetStateProperty.all(BorderSide(
                          color: app_color.appColorGeneral,
                          width: 1.5
                        )) ,
                      ),
                      child:Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: app_color.appColorGeneral, // لون الخلفية
                            borderRadius: BorderRadius.circular(10), // زوايا دائرية اختيارية
                          ),
                          padding: EdgeInsets.all(12), // زيادة المساحة داخل الـ Container
                          child: Icon(
                            Icons.location_on,
                            color: app_color.appColorsWhite, // لون الأيقونة
                            size: 30, // تكبير حجم الأيقونة إذا لزم الأمر
                          ),
                        ),
                        10.spaceHorzintail,
                        Text(
                          'Cairo, Egypt',
                          style: TextStyle(
                            color: app_color.appColorGeneral,
                            fontSize: 18,
                          ),
                        ),
                        160.spaceHorzintail,
                        Icon(Icons.arrow_forward_ios_outlined, color: app_color.appColorGeneral,)
                      ],
                    ),
                    ),
                  ),
                  10.spaceVertcial,
                  OutlinedButton(onPressed: () {
                   if (formKey.currentState!.validate()) {
                     if (selectedData != null) {
                       //(here he must check if the date is selected or not and continue to create)
                       EventDataModel date = EventDataModel(
                         isfavorute: false,
                           Evanttitle: _TitleControl.text,
                           EvantDate: selectedData!,
                           description: _descreption.text, EnantIamge: EvantCatroryListViwe[seletTap].evantCategoryImage,
                           EvantCategray: EvantCatroryListViwe[seletTap].evantCategoryName);
                       EasyLoading.show();
                       firebasefunction().CreateNewEvant(date).then((value) {
                         if(value == true){
                           EasyLoading.dismiss();
                           SanckBarServices.showSuccessMessage("sucsess Created");
                           Navigator.pop(context);
                         }
                       }
                       );}else{
                       SanckBarServices.showErrorMessage("you must Choose Data");
                     }
                   }
                  }, child: Text("Creata Event", style: TextStyle(
                      fontSize: 20,
                      fontWeight:FontWeight.w700,
                      color: app_color.appColorsWhite
                  ),),
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size(390, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: app_color.appColorGeneral
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void SelectedDateToShow(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedData ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (newDate != null && newDate != selectedData) {
      setState(() {
        selectedData = newDate;
      });
      print("Selected Date: ${DateFormat("dd MMM yyyy").format(selectedData!)}");
    }
  }

}
