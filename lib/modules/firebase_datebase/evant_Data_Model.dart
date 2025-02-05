import 'package:cloud_firestore/cloud_firestore.dart';

class EventDataModel {
  static const collectionNamed = "EvantDataModelCollection";
  String EvantId;
  String Evanttitle;
  DateTime EvantDate;
  String description;
  String EnantIamge;
  bool isfavorute;
  String EvantCategray;

  EventDataModel({
    this.EvantId = "",
    required this.Evanttitle,
    required this.EvantDate,
    required this.description,
    required this.EnantIamge,
    required this.EvantCategray,
    required this.isfavorute,
  });

  // Convert object to Firestore document format (Map)
  Map<String, dynamic> tofireStore() {
    return {
      "EvantId": EvantId,
      "Evanttitle": Evanttitle,
      "EvantDate": EvantDate,
      "description": description,
      "EnantIamge": EnantIamge,
      "EvantCategray": EvantCategray,
      "isfavorute": isfavorute,
    };
  }
  // Convert Firestore document (Map) to object
  factory EventDataModel.fromJason(Map<String, dynamic> jason) {
    return EventDataModel(
      EvantDate: (jason["EvantDate"] is Timestamp)
          ? (jason["EvantDate"] as Timestamp).toDate()  // Convert Timestamp to DateTime
          : DateTime.fromMicrosecondsSinceEpoch(jason["EvantDate"]),
      isfavorute: jason["isfavorute"] ?? false,
      description: jason["description"],
      EvantId: jason["EvantId"] ?? '',
      Evanttitle: jason["Evanttitle"],
      EnantIamge: jason["EnantIamge"],
      EvantCategray: jason["EvantCategray"],
    );
  }
}