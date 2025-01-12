import 'package:flutter/material.dart';
import 'package:hypertension_app/common/widgets/appbar/appbar.dart';
import 'package:hypertension_app/features/core/screens/home/widget/form_widget.dart';
import 'package:hypertension_app/utils/constants/colors.dart';
import 'package:hypertension_app/utils/constants/sizes.dart';
import 'package:hypertension_app/utils/constants/text_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UniSizes.defaultSpace),
          child: Column(
            children: [
              //header
              UniAppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(UniTexts.homeAppBarTitle,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: UniColors.grey)),
                  ],
                ),
              ),

              //Form
              const FormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
