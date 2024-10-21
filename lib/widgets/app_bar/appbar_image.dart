import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarImage extends StatelessWidget {
  AppbarImage(
    {Key? key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin})
    : super(
        key: key,
      );

  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: CustomImageView(
          imagePath: imagePath!,
          height: height ?? 40.h,
          width: width ?? 40.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
