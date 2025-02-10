import 'package:evanly/core/extensions/extensions.dart';
import 'package:evanly/modules/create_Evant/widget_selcetd-tab.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/extensions/custom_form_Filed.dart';
import 'package:evanly/core/routes/pageRouts.dart';
import 'package:evanly/core/services/sanck_bar_services.dart';
import 'package:evanly/core/utils/firebaseFunction.dart';
import 'package:evanly/modules/firebase_datebase/evant_Data_Model.dart';
import 'package:evanly/core/evant_map/evant_map.dart';

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
    EvantCatrory(evantCategoryName: "BookClub", evantCategoryIcon: Icons.menu_book_rounded, evantCategoryImage: app_images.BookClubIamge),
    EvantCatrory(evantCategoryName: "Sports", evantCategoryIcon: Icons.directions_bike, evantCategoryImage: app_images.SportsImage),
    EvantCatrory(evantCategoryName: "Holiday", evantCategoryIcon: Icons.view_comfortable, evantCategoryImage: app_images.HolidayImage),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: eventCategories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Event", style: TextStyle(color: app_color.appColorGeneral)),
          bottom: TabBar(
            onTap: (index) => setState(() => selectedTab = index),
            indicatorColor: app_color.appColorGeneral,
            labelColor: app_color.appColorGeneral,
            unselectedLabelColor: app_color.appColorGeneral,
            tabs: eventCategories.map((category) => _buildTabItem(category)).toList(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Image.asset(eventCategories[selectedTab].evantCategoryImage, fit: BoxFit.cover),
                const SizedBox(height: 20),
                _buildSectionTitle("Title"),
                CustomFormField(controller: _titleController, hintText: "What do you want to do?", prefixIcon: Icons.edit_note),
                _buildSectionTitle("Description"),
                CustomFormField(controller: _descriptionController, hintText: "Event Description"),
                _buildDateTimePicker(context, "Event Date", Icons.calendar_month, _selectDate, selectedDate != null ? DateFormat("dd MMM yyyy").format(selectedDate!) : "Choose Date"),
                _buildDateTimePicker(context, "Event Time", Icons.access_time, () {}, "Choose Time"),
                _buildSectionTitle("Location"),
                _buildLocationButton(screenWidth),
                _buildCreateEventButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(EvantCatrory category) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(category.evantCategoryIcon, color: selectedTab == eventCategories.indexOf(category) ? app_color.appColorGeneral : app_color.appColorGeneral),
          const SizedBox(width: 8),
          Text(category.evantCategoryName, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Text(title, style: TextStyle(color: app_color.appColorsecound, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildDateTimePicker(BuildContext context, String label, IconData icon, VoidCallback onTap, String value) {
    return ListTile(
      leading: Icon(icon, color: app_color.appColorsecound),
      title: Text(label, style: TextStyle(color: app_color.appColorsecound, fontSize: 18)),
      trailing: GestureDetector(
        onTap: onTap,
        child: Text(value, style: TextStyle(color: app_color.appColorGeneral, fontSize: 18)),
      ),
    );
  }

  Widget _buildLocationButton(double screenWidth) {
    return ElevatedButton(
      onPressed: () => context.navigateTo(EvantMap()),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        side: BorderSide(color: app_color.appColorGeneral, width: 1.5),
      ),
      child: Row(
        children: [
          SizedBox(width: screenWidth * 0.020),
          Icon(Icons.location_on, color: app_color.appColorGeneral, size: 30),
          SizedBox(width: screenWidth * 0.050),
          Text("Cairo, Egypt", style: TextStyle(color: app_color.appColorGeneral, fontSize: 18)),
          Spacer(),
          Icon(Icons.arrow_forward_ios_outlined, color: app_color.appColorGeneral),
        ],
      ),
    );
  }

  Widget _buildCreateEventButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: _createEvent,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          backgroundColor: app_color.appColorGeneral,
        ),
        child: Text("Create Event", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
      ),
    );
  }

  void _selectDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (newDate != null) {
      setState(() => selectedDate = newDate);
    }
  }

  void _createEvent() {
    if (formKey.currentState!.validate() && selectedDate != null) {
      // تنفيذ إنشاء الحدث
      SanckBarServices.showSuccessMessage("Success Created");
    } else {
      SanckBarServices.showErrorMessage("You must choose a date");
    }
  }
}
