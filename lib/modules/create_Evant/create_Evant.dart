import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/modules/create_Evant/widget_selcetd-tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/custom_form_Filed.dart';
import 'package:evanly/core/routes/pageRouts.dart';
import 'package:evanly/core/services/sanck_bar_services.dart';
import 'package:evanly/core/utils/firebaseFunction.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
import 'package:evanly/core/evant_map/evant_map.dart';

import '../homeScreen/widget/list_ bulider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int selectedTab = 0;
  DateTime? selectedDate;

  final List<EvantCatrory> eventCategories = [
    EvantCatrory(evantCategoryName: "BookClub",
        evantCategoryIcon: Icons.menu_book_rounded,
        evantCategoryImage: app_images.BookClubIamge),
    EvantCatrory(evantCategoryName: "Sports",
        evantCategoryIcon: Icons.directions_bike,
        evantCategoryImage: app_images.SportsImage),
    EvantCatrory(evantCategoryName: "Holiday",
        evantCategoryIcon: Icons.view_comfortable,
        evantCategoryImage: app_images.HolidayImage),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new event"),
      ),
        body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
    child: Form(
    key: formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width *1.0,
          height: size.height * 0.21,

          child: SizedBox(
            width: size.width *1.0,
            height: size.height * 0.21,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                eventCategories[selectedTab].evantCategoryImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        DefaultTabController(
          length: 3,
          child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
              padding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              indicator: const BoxDecoration(),
              onTap: (value) {
                setState(() {
                  selectedTab = value;
                });
              },
              tabs: eventCategories.map(
                    (element) {
                  return TabWidget(
                    eventCategory: element,
                    isSelected:
                    selectedTab == eventCategories.indexOf(element),
                  );
                },
              ).toList()),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Title",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        CustomFormField(
          controller: _titleController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please enter your title";
            }
            return null;
          },
          hintText: "Title",
          prefixIcon: Icons.edit,
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Description",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        CustomFormField(
          controller: _descriptionController,
          hintText: "Description",
          prefixIcon: Icons.edit,
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            const Icon(Icons.calendar_month),
            const SizedBox(width: 10),
            Text(
              "Event Date",
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                selectEventDate(context);
              },
              child: Text(
                selectedDate != null
                    ? DateFormat("dd MMM yyy").format(selectedDate!)
                    : "Choose Date",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: app_color.appColorGeneral,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Location",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ElevatedButton(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: app_color.appColorGeneral,
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Icon(
                  color: Colors.deepPurple,
                  Icons.my_location_outlined,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Choose Event Location",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: app_color.appColorGeneral),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ],
          ) ,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EvantMap()));
          },
          style: ElevatedButton.styleFrom(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),),
            side: BorderSide(
              color: app_color.appColorGeneral
            )
          ),
          ),
        SizedBox(height: 20,),
        ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (selectedDate != null) {
                  EventDataModel data = EventDataModel(
                    eventTitle: _titleController.text,
                    eventDescription: _descriptionController.text,
                    eventImage:
                    eventCategories[selectedTab].evantCategoryImage,
                    eventDate: selectedDate!,
                    eventCategory:
                    eventCategories[selectedTab].evantCategoryName,
                  );

                  EasyLoading.show();
                  firebasefunction.creatNewEvent(data).then(
                        (value) {
                      EasyLoading.dismiss();
                      if (value == true) {
                        Navigator.pop(context);
                        SanckBarServices.showSuccessMessage(
                            "Event was successfully created");
                      }
                    },
                  );
                } else {
                  SanckBarServices.showErrorMessage(
                      "you must select event date");
                }
              }
            },
            style: ElevatedButton.styleFrom(
                padding:  EdgeInsets.symmetric(
                    horizontal: 8, vertical: 20),
                elevation: 0,
                backgroundColor: app_color.appColorGeneral,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                side: BorderSide(color: app_color.appColorGeneral)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Event",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: app_color.appColorsWhite,
                  ),
                ),
              ],
            )),
      ],
    )
    ),)
    );
  }
  void selectEventDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
      print(selectedDate);
    }
  }
}
