import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../custom_icon_button.dart';

class AppbarTrailingIconbutton extends StatelessWidget {
  AppbarTrailingIconbutton({
    Key? key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String? imagePath;
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
        child: CustomIconButton(
          height: height ?? 34.h,
          width: width ?? 34.h,
          padding: EdgeInsets.all(6.h),
          decoration: IconButtonStyleHelper.fillGray,
          child: CustomImageView(
            imagePath: imagePath ?? ImageConstant.iconCam,
          ),
        ),
      ),
    );
  }
}
