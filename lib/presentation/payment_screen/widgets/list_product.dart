import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';

class ListplayOne2ItemWidget extends StatelessWidget {
  const ListplayOne2ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 60.h,
          width: 66.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomIconButton(
                height: 60.h,
                width: 60.h,
                padding: EdgeInsets.all(4.h),
                decoration: IconButtonStyleHelper.none,
                child: CustomImageView(
                  imagePath: ImageConstant.imgProduct3,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 24.h,
                  height: 22.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 8.h),
                  decoration: BoxDecoration(
                    color: appTheme.indigo50,
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                    border: Border.all(
                      color: theme.colorScheme.onErrorContainer,
                      width: 2.h,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  child: Text(
                    "1",
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.labelLargeBlack900Bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 142.h,
            margin: EdgeInsets.only(
              left: 8.h,
              top: 12.h,
            ),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(
                height: 1.33,
              ),
            ),
          ),
        ),
        Spacer(),
        Text(
          "\$17,00",
          style: CustomTextStyles.titleMediumBlack900,
        ),
      ],
    );
  }
}
