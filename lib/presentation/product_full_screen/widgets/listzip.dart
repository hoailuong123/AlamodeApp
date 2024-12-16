import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class Listzipcode3ItemWidget extends StatelessWidget {
  const Listzipcode3ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.h,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 102.h,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgProduct2,
                  height: 102.h,
                  width: double.maxFinite,
                  radius: BorderRadius.circular(
                    5.h,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgProduct3,
                  height: 102.h,
                  width: double.maxFinite,
                  radius: BorderRadius.circular(
                    5.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "1780",
                style: CustomTextStyles.titleSmallBlack90015,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgProduct4,
                height: 10.h,
                width: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.h),
                child: Text("New", style: theme.textTheme.labelLarge),
              )
            ],
          ),
        ],
      ),
    );
  }
}
