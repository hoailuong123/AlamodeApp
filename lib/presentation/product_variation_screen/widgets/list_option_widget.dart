import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class ListOptionWidget extends StatelessWidget {
  const ListOptionWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78.h,
      width: 78.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgProduct4,
            height: 78.h,
            width: 78.h,
            radius: BorderRadius.circular(
              5.h,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
            height: 22.h,
            width: 24.h,
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(
              left: 8.h,
              bottom: 6.h,
            ),
          ),
        ],
      ),
    );
  }
}
