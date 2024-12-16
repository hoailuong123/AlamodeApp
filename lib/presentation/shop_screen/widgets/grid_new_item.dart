import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class GridNewItemWidget extends StatelessWidget {
  const GridNewItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(4.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.onErrorContainer,
              borderRadius: BorderRadiusStyle.roundedBorder10,
              boxShadow: [
                BoxShadow(
                  color: appTheme.black900.withOpacity(0.1),
                  spreadRadius: 2.h,
                  blurRadius: 2.h,
                  offset: Offset(
                    0,
                    5,
                  ),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                    ),
                    child: Container(
                      height: 128.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.img,
                            height: 128.h,
                            width: 130.h,
                            radius: BorderRadius.circular(
                              5.h,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.img,
                            height: 128.h,
                            width: 130.h,
                            radius: BorderRadius.circular(
                              5.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: 118.h,
            child: Text(
              "Lorem ipsum dolor sit amet consectetur.",
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
    );
  }
}
