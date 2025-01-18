import 'package:flutter/cupertino.dart';

class on_bordingMpdel{//xxxxxxxxxxxxxxxxxxxxxxxx
  String ImagePath;
  String title;
  String? dcs;
  on_bordingMpdel({required this.ImagePath, required this.title,  this.dcs});
  static List<on_bordingMpdel> ListOnBording = [
    on_bordingMpdel(ImagePath: "assets/images/hot-trending.png", title: "Find Events That Inspire You", dcs:
        "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone."
            " Our curated recommendations will help you explore, connect,"
            " and make the most of every opportunity around you.",),
    on_bordingMpdel(ImagePath: "assets/images/being-creative (1).png", title: "Effortless Event Planning", dcs: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters"
        " – creating an unforgettable experience for you and your guests."),
    on_bordingMpdel(ImagePath: "assets/images/being-creative (2).png", title: "Connect with Friends & Share Moments", dcs: "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement"
        " with your network, so you can relive the highlights and cherish the memories."),
  ];
}
