import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart'; // ignore_for_file: must_be_immutable
class DeletingAccountDialog extends StatelessWidget {
  const DeletingAccountDialog({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 36.h,
            vertical: 24.h,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.onErrorContainer,
            borderRadius: BorderRadiusStyle.roundedBorder66,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 34.h),
              Text(
                "You are going to delete\nyour account",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleMedium_1.copyWith(
                  height: 1.42,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "You won't be able to restore your data",
                style:
                    CustomTextStyles.labelLargeNunitoSansBlack900SemiBold,
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        text: "Cancel",
                    
                        buttonStyle: CustomButtonStyles.fillErrorContainer,
                      ),
                    ),
                    SizedBox(width: 16.h),
                    Expanded(
                      child: CustomElevatedButton(
                        text: "Delete",
                        buttonStyle: CustomButtonStyles.fillPink,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}