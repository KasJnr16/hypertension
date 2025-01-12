import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hypertension_app/utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;
  String campusName;
  String gender;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.campusName,
    required this.profilePicture,
    required this.gender,
  });

  String get fullName => "$firstName $lastName";

  String get formattedPhoneNo => Formatters.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(String fullName) => fullName.split(" ");

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUsername";
    return userNameWithPrefix;
  }

   // Generic method to update a field by name
  void setFieldValue(String fieldName, String newValue) {
    switch (fieldName) {
      case 'FirstName':
        firstName = newValue;
        break;
      case 'LastName':
        lastName = newValue;
        break;
      case 'Username':
        username = newValue;
        break;
      case 'Email':
        email = newValue;
        break;
      case 'PhoneNumber':
        phoneNumber = newValue;
        break;
      case 'Gender':
        gender = newValue;
        break;
      case 'CampusName':
        campusName = newValue;
        break;
      default:
        throw 'Invalid field name: $fieldName';
    }
  }

  static UserModel empty() => UserModel(
        id: "",
        firstName: "",
        lastName: "",
        username: "",
        email: "",
        phoneNumber: "",
        campusName: "",
        gender: "",
        profilePicture: "",
      );

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Username": username,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "CampusName": campusName,
      "Gender": gender,
      "ProfilePicture": profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data["FirstName"] ?? "",
        lastName: data["LastName"] ?? "",
        username: data["Username"] ?? "",
        email: data["Email"] ?? "",
        phoneNumber: data["PhoneNumber"] ?? "",
        campusName: data["CampusName"] ?? "",
        gender: data["Gender"] ?? "",
        profilePicture: data["ProfilePicture"] ?? "",
      );
    }
    return UserModel.empty();
  }
}
