import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';



class SliderItem extends StatelessWidget {
  const SliderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgProduct5,
            height: 130.h,
            width: double.maxFinite,
            radius: BorderRadius.circular(8.h),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 18.h,
              top: 2.h,
              bottom: 2.h,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: fs.Svg(
                  ImageConstant.imgProduct5,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Text(
                  "Big Sale",
                  style: CustomTextStyles.headlineMediumOnErrorContainer,
                ),
                Text(
                  "Up to 50%",
                  style: CustomTextStyles.labelLargeNunitoSansOnErrorContainer,
                ),
                SizedBox(height: 28.h),
                Text(
                  "Happening \nNow",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.labelMediumRalewayOnErrorContainer.copyWith(
                    height: 1.36,
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
