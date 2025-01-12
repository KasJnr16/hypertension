import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String? id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String region;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.region,
    this.dateTime,
    this.selectedAddress = true,
  });

  // Empty AddressModel for defaults
  static AddressModel empty() => AddressModel(
        id: "",
        name: "",
        phoneNumber: "",
        street: "",
        city: "",
        region: "",
      );

  // Convert AddressModel to JSON for Firestore storage
  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "PhoneNumber": phoneNumber,
      "Street": street,
      "City": city,
      "Region": region,
      "DateTime": DateTime.now(),
      "SelectedAddress": selectedAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> document) {
    final data = document;
    if (data.isNotEmpty) {
      return AddressModel(
        id: data["Id"],
        name: data["Name"] ?? "",
        phoneNumber: data["PhoneNumber"] ?? "",
        street: data["Street"] ?? "",
        city: data["City"] ?? "",
        region: data["Region"] ?? "",
        dateTime: (data["DateTime"] as Timestamp).toDate(),
        selectedAddress: data["SelectedAddress"] as bool,
      );
    }
    return AddressModel.empty();
  }

  // Factory constructor to create AddressModel from Firestore snapshot
  factory AddressModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return AddressModel(
        id: document.id,
        name: data["Name"] ?? "",
        phoneNumber: data["PhoneNumber"] ?? "",
        street: data["Street"] ?? "",
        city: data["City"] ?? "",
        region: data["Region"] ?? "",
        dateTime: (data["DateTime"] as Timestamp).toDate(),
        selectedAddress: data["SelectedAddress"] ?? false,
      );
    }
    return AddressModel.empty();
  }

  @override
  String toString() {
    return "$street, $city, $region";
  }
}
