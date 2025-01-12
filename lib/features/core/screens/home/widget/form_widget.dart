import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension_app/features/core/controllers/form_controller.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';
import 'package:hypertension_app/utils/constants/text_string.dart';
import 'package:hypertension_app/utils/validators/validator.dart';
import 'package:iconsax/iconsax.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormController());

    return Form(
      child: Column(
        children: [
          //age
          TextFormField(
            controller: controller.age,
            validator: (value) => UniValidator.validateEmptyText("Age", value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), labelText: "Age"),
          ),
          const SizedBox(height: UniSizes.spaceBtwInputFields),

          //Bp
          TextFormField(
            controller: controller.bloodPressure,
            validator: (value) =>
                UniValidator.validateEmptyText("Blood Pressure", value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "Blood Pressure"),
          ),
          const SizedBox(height: UniSizes.spaceBtwSection),

          //Submit Btn
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.sumbitUserData(),
                  child: const Text(UniTexts.submit))),
        ],
      ),
    );
  }
}
