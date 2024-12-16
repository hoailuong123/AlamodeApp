import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 394.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgNewBag,
            height: 394.h,
            width: double.maxFinite,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgNewBag,
            height: 394.h,
            width: double.maxFinite,
          ),
        ],
      ),
    );
  }
}