import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarSubtitleTwo extends StatelessWidget {
  AppbarSubtitleTwo({Key? key, required this.text, this.onTap, this.margin})
      : super(key: key);

  final String text;
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
        child: Container(
          width: 106.h,
          height: 36.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.onErrorContainer,
            borderRadius: BorderRadius.circular(6.h),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.gray900,
            ),
          ),
        ),
      ),
    );
  }
}
