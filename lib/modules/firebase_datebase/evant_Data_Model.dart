import 'package:flutter/material.dart';

class EventDataModel{
  static const collectionNamed = "EvantDataModelCollection";
    String EvantId;
   final String Evanttitle;
   final DateTime EvantDate;
   // final TimeOfDay EvantTime;
   final String description;
   final String EnantIamge;
   //final bool isfavorute;
   final String EvantCategray;
  EventDataModel({
     this.EvantId = "", required this.Evanttitle, required this.EvantDate,
     required this.description, required this.EnantIamge,
     required this.EvantCategray});
  // we need to convert this object to Jason
   // always jason data type is map
   // left Key , right whatever(value)
Map<String, dynamic> tofireStore(){
  return {"EvantId": EvantId
    ,"Evanttitle": Evanttitle,
    "EvantDate": EvantDate.microsecondsSinceEpoch,
    //(firebase firestore cannot take parameter from DateTime? )
    //"EvantTime": EvantTime,
    "description": description,
    "EnantIamge": EnantIamge,
    "EvantCategray": EvantCategray,
   // "isfavorute": isfavorute,
  };
}
   // we need to convert the jason to object // name jason is just name to selected
   // factory make named constructor can return type by this function
factory EventDataModel.fromJason(Map<String, dynamic> jason)
   =>
   EventDataModel(
   EvantDate: DateTime.fromMicrosecondsSinceEpoch(jason["EvantDate"]),
   //isfavorute: jason["isfavorute"],
     description: jason["description"],
   EvantId: jason["EvantId"],
     Evanttitle: jason["Evanttitle"],
     //EvantTime: jason["EvantTime"],
     EnantIamge: jason["EnantIamge"],
     EvantCategray: jason["EvantCategray"],

 );
}