import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class SuggestedproductsItemWidget extends StatelessWidget {
  const SuggestedproductsItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.onErrorContainer,
            borderRadius: BorderRadiusStyle.roundedBorder10,
            boxShadow: [
              BoxShadow(
                color: appTheme.black900.withOpacity(0.1),
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: const Offset(
                  0,
                  5,
                ),
              )
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgProduct6,
              height: 170.h,
              width: double.maxFinite,
              radius: BorderRadius.circular(
                5.h,
              ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 118.h,
              child: Text(
                "Lorem ipsum dolor sit amet consectetur",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall!.copyWith(
                  height: 1.33,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "\$17,00",
              style: theme.textTheme.titleMedium,
            )
          ],
        ),
      ],
    );
  }
}