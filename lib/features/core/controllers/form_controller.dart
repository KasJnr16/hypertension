import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension_app/utils/http/http_client.dart';
import 'package:hypertension_app/utils/popups/loaders.dart';

class FormController extends GetxController {
  static FormController get Instance => Get.find();

  final age = TextEditingController();
  final bloodPressure = TextEditingController();

  void sumbitUserData() async {
    final userData = {
      "age": int.parse(age.text),
      "bp": double.parse(bloodPressure.text)
      //More fields I need
    };

    try {
       await HttpClient.post("predict",userData);
    } catch (e) {
      UniLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
