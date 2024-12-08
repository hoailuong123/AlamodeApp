import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';

class ListplayOne1ItemWidget extends StatelessWidget {
  const ListplayOne1ItemWidget({Key? key})
      : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      height: 60.h,
      width: 60.h,
      padding: EdgeInsets.all(4.h),
      decoration: IconButtonStyleHelper.none,
      child: CustomImageView(
        imagePath: ImageConstant.img,
      ),
    );
  }
}
