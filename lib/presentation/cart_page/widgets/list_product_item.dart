import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProductListItemWidget extends StatelessWidget {
  ProductListItemWidget({Key? key}) : super(key: key);

  TextEditingController quantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.zero,
          color: theme.colorScheme.errorContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Container(
            height: 108.h,
            width: 128.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.errorContainer,
              borderRadius: BorderRadiusStyle.roundedBorder10,
              boxShadow: [
                BoxShadow(
                  color: appTheme.black900.withOpacity(0.1),
                  spreadRadius: 2.h,
                  blurRadius: 2.h,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgProduct3,
                  height: 100.h,
                  width: double.maxFinite,
                  radius: BorderRadius.circular(5.h),
                ),
                Container(
                  height: 100.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgProduct6,
                        height: 100.h,
                        width: double.maxFinite,
                        radius: BorderRadius.circular(5.h),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h, bottom: 6.h),
                        child: CustomIconButton(
                          height: 34.h,
                          width: 34.h,
                          padding: EdgeInsets.all(6.h),
                          decoration:
                              IconButtonStyleHelper.fillonErrorContainer,
                          alignment: Alignment.bottomLeft,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgFrame,
                          ),
                          onTap: () { // Thay 'onPressed' bằng 'onTap'
                            // Thêm hành vi khi nhấn nút, ví dụ xóa sản phẩm khỏi giỏ hàng
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 142.h,
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall!.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Pink, Size M",
                style: CustomTextStyles.titleSmallBlack900,
              ),
              SizedBox(height: 18.h),
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Text(
                          "\$17,00",
                          style: CustomTextStyles.titleMediumBlack900,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 30.h,
                              width: 30.h,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgProfile,
                                    height: 30.h,
                                    width: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: CustomTextFormField(
                              readOnly: true,
                              width: 36.h,
                              controller: quantity,
                              hintText: "1",
                              hintStyle:
                                  CustomTextStyles.titleMediumBlack900Medium16,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.h,
                                vertical: 6.h,
                              ),
                              borderDecoration:
                                  TextFormFieldStyleHelper.fillIndigo,
                              fillColor: appTheme.indigo50,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 30.h,
                              width: 30.h,
                              margin: EdgeInsets.only(left: 6.h),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgCamera,
                                    height: 30.h,
                                    width: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
