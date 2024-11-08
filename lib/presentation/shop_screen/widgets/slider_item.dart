import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../../core/app_export.dart';

class Sliderdb257e4f2ItemWidget extends StatelessWidget {
  const Sliderdb257e4f2ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img,
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
                  ImageConstant.img,
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
