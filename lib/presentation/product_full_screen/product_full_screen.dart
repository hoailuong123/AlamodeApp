import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_rating_bar.dart';
import 'widgets/image_item.dart';
import 'widgets/listbac_item.dart';
import 'widgets/listzip.dart';
import 'widgets/material_item.dart';
import 'widgets/suggest_product_item.dart';

// ignore_for_file: must_be_immutable
class ProductFullScreen extends StatelessWidget {
  ProductFullScreen({Key? key})
      : super(
          key: key,
        );
  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              height: 2230.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "Rating & Reviews",
                              style: CustomTextStyles.titleLargeBlack900,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _buildRatingBarSection(context),
                        SizedBox(height: 20.h),
                        _buildReviewSection(context),
                        SizedBox(height: 18.h),
                        CustomElevatedButton(
                          height: 40.h,
                          text: "View All Reviews",
                          margin: EdgeInsets.only(
                            left: 10.h,
                            right: 8.h,
                          ),
                          buttonStyle: CustomButtonStyles.none,
                        ),
                        SizedBox(height: 228.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "You Might Like",
                              style: CustomTextStyles.titleLargeBlack900,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        _buildSuggestedProducts(context),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildImageSlider(context),
                          SizedBox(height: 18.h),
                          _buildProductDetails(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildRatingBarSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      child: Row(
        children: [
          CustomRatingBar(
            initialRating: 0,
            itemSize: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 12.h),
            padding: EdgeInsets.symmetric(horizontal: 6.h),
            decoration: BoxDecoration(
              color: appTheme.blue5001,
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Text(
              "4/5",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildReviewSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 16.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.onErrorContainer,
              borderRadius: BorderRadiusStyle.circleBorder20,
              border: Border.all(
                color: theme.colorScheme.onErrorContainer,
                width: 4.h,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              boxShadow: [
                BoxShadow(
                  color: appTheme.black900.withOpacity(0.16),
                  spreadRadius: 2.h,
                  blurRadius: 2.h,
                  offset: const Offset(
                    1,
                    0,
                  ),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.img,
                  height: 40.h,
                  width: 40.h,
                ),
              ],
            ),
          ),
          SizedBox(width: 20.h),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Veronika",
                    style: CustomTextStyles.titleMediumBlack900SemiBold,
                  ),
                  SizedBox(height: 4.h),
                  CustomRatingBar(
                    initialRating: 4,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed...",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall!.copyWith(
                      height: 1.50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSuggestedProducts(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h),
      child: ResponsiveGridListBuilder(
        minItemWidth: 1,
        minItemsPerRow: 2,
        maxItemsPerRow: 2,
        horizontalGridSpacing: 4.h,
        verticalGridSpacing: 4.h,
        builder: (context, items) => ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          children: items,
        ),
        gridItems: List.generate(
          6,
          (index) {
            return SuggestedproductsItemWidget();
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildImageSlider(BuildContext context) {
    return SizedBox(
      height: 394.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 394.h,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                sliderIndex = index;
              },
            ),
            itemCount: 1,
            itemBuilder: (context, index, realIndex) {
              return ImageItemWidget();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 10.h,
              margin: EdgeInsets.only(bottom: 10.h),
              child: AnimatedSmoothIndicator(
                activeIndex: sliderIndex,
                count: 1,
                axisDirection: Axis.horizontal,
                effect: ScrollingDotsEffect(
                  spacing: 10,
                  activeDotColor: appTheme.blue800,
                  dotColor: appTheme.blue800.withOpacity(0.2),
                  dotHeight: 10.h,
                  dotWidth: 10.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProductDetails(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 4.h),
            child: Row(
              children: [
                Text(
                  "\$17,00",
                  style: CustomTextStyles.headlineMediumBlack900ExtraBold,
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(right: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomIconButton(
                          height: 30.h,
                          width: 30.h,
                          decoration: IconButtonStyleHelper.none,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgShare,
                          ),
                        ),
                        SizedBox(height: 94.h),
                        CustomIconButton(
                          height: 30.h,
                          width: 30.h,
                          decoration: IconButtonStyleHelper.none,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgArrowLeft,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 322.h,
            margin: EdgeInsets.only(left: 4.h),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium!.copyWith(
                height: 1.33,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 4.h),
            child: Row(
              children: [
                Text(
                  "Variations",
                  style: CustomTextStyles.titleLargeBlack900,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.h,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: appTheme.gray5001,
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "Pink",
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleSmallBlack900,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 6.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: appTheme.gray5001,
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "M",
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleSmallBlack900,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            margin: EdgeInsets.only(
              left: 4.h,
              right: 118.h,
            ),
            width: double.maxFinite,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 6.h,
                children: List.generate(
                  3,
                  (index) {
                    return ListbabacItemWidget();
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "Specifications",
              style: CustomTextStyles.titleLargeBlack900,
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              "Material",
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 4.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: 6.h,
                spacing: 6.h,
                children: List<Widget>.generate(
                  2,
                  (index) => ChipviewmateriaItemWidget(),
                ),
              ),
            ),
          ),
          SizedBox(height: 14.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Origin",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.h,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: appTheme.indigo50,
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Text(
                    "EU",
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleSmallBlack900,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 6.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Size guide",
                        style: theme.textTheme.titleMedium,
                      ),
                      CustomIconButton(
                        height: 30.h,
                        width: 30.h,
                        padding: EdgeInsets.all(6.h),
                        decoration: IconButtonStyleHelper.fillPrimary,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgArrow,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery",
                  style: CustomTextStyles.titleLargeBlack900,
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 16.h),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: _buildExpressDeliveryOption(
                          context,
                          productTitle: "Standard",
                          deliveryDuration: "5-7 days",
                          productPrice: "\$3,00",
                        ),
                      ),
                      SizedBox(height: 6.h),
                      SizedBox(
                        width: double.maxFinite,
                        child: _buildExpressDeliveryOption(
                          context,
                          productTitle: "Express",
                          deliveryDuration: "1-2 days",
                          productPrice: "\$12,00",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 302.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Most Popular",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "See All",
                          style: CustomTextStyles.titleSmall15,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 12.h,
                          bottom: 4.h,
                        ),
                        child: CustomIconButton(
                          height: 30.h,
                          width: 30.h,
                          padding: EdgeInsets.all(6.h),
                          decoration: IconButtonStyleHelper.fillPrimary,
                          alignment: Alignment.center,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgArrow,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 6.h,
                      children: List.generate(
                        4,
                        (index) {
                          return Listzipcode3ItemWidget();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomNavigation(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.16),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -1,
            ),
          )
        ],
      ),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 40.h,
            width: 46.h,
            padding: EdgeInsets.all(6.h),
            decoration: IconButtonStyleHelper.fillGrayTL10,
            child: CustomImageView(
              imagePath: ImageConstant.imgLike,
            ),
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: CustomElevatedButton(
              height: 40.h,
              text: "Add to cart",
              buttonStyle: CustomButtonStyles.none,
            ),
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: CustomElevatedButton(
              height: 40.h,
              text: "Buy now",
              buttonStyle: CustomButtonStyles.none,
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildExpressDeliveryOption(
    BuildContext context, {
    required String productTitle,
    required String deliveryDuration,
    required String productPrice,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder10,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            productTitle,
            style: CustomTextStyles.titleMediumBlack900Medium.copyWith(
              color: appTheme.black900,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 14.h),
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 2.h,
              ),
              decoration: BoxDecoration(
                color: appTheme.gray5002,
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Text(
                deliveryDuration,
                textAlign: TextAlign.center,
                style: CustomTextStyles.labelLargePrimary.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          Spacer(),
          Text(
            productPrice,
            style: CustomTextStyles.titleMediumBlack900.copyWith(
              color: appTheme.black900,
            ),
          ),
        ],
      ),
    );
  }
}
