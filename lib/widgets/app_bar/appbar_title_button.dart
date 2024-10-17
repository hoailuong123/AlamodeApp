import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../custom_elevated_button.dart';

class AppbarTitleButton extends StatelessWidget {
  AppbarTitleButton({Key? key, this.onTap, this.margin})
      : super(
          key: key,
        );

  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: SizedBox(
          width: double.maxFinite,
          height: 34.h,
          child: CustomElevatedButton(
            text: "My Activity",
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: CustomTextStyles.titleMediumOnErrorContainer,
          ),
        ),
      ),
    );
  }
}
