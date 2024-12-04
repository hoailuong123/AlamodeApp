import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class Griddiscount1ItemWidget extends StatelessWidget {
  const Griddiscount1ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.zero,
      color: theme.colorScheme.onErrorContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Container(
        height: 114.h,
        padding: EdgeInsets.all(4.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.onErrorContainer,
          borderRadius: BorderRadiusStyle.roundedBorder10,
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withOpacity(0.1),
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.img,
              height: 102.h,
              width: double.maxFinite,
              radius: BorderRadius.circular(5.h),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.customBorderTL5,
                  gradient: LinearGradient(
                    begin: Alignment(1, 0),
                    end: Alignment(0, 0),
                    colors: [appTheme.pink300, appTheme.redA400],
                  ),
                ),
                child: Text(
                  "-20%",
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.labelLargeOnErrorContainerBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
