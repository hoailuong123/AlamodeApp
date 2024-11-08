import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class Grid532c6dcf29c1ItemWidget extends StatelessWidget {
  const Grid532c6dcf29c1ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(4.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        borderRadius: BorderRadiusStyle.roundedBorder10,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              5,
            ),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.img,
                height: 74.h,
                width: 74.h,
                radius: BorderRadius.circular(5.h),
              ),
              SizedBox(width: 4.h),
              CustomImageView(
                imagePath: ImageConstant.img,
                height: 74.h,
                width: 74.h,
                radius: BorderRadius.circular(5.h),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img,
                        height: 74.h,
                        width: 74.h,
                        radius: BorderRadius.circular(5.h),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Clothing",
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img,
                        height: 74.h,
                        width: 74.h,
                        radius: BorderRadius.circular(5.h),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.h),
                        decoration: BoxDecoration(
                          color: appTheme.blue5001,
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Text(
                          "109",
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.labelLargeBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
