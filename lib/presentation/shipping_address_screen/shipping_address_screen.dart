import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class ShippingAddressScreen extends StatelessWidget {
  ShippingAddressScreen({Key? key}) : super(key: key);

  TextEditingController fieldoneController = TextEditingController();
  TextEditingController fieldthreeController = TextEditingController();
  TextEditingController fieldfiveController = TextEditingController();
  TextEditingController fieldsevenController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 20.h,
                top: 20.h,
                right: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    "Settings",
                    style: theme.textTheme.headlineMedium,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Shipping Address",
                    style: CustomTextStyles.titleMediumBlack900Medium16,
                  ),
                  SizedBox(height: 24.h),
                  _buildCountrySelectionRow(context),
                  SizedBox(height: 22.h),
                  _buildAddressInputColumn(context),
                  SizedBox(height: 22.h),
                  _buildCityInputColumn(context),
                  SizedBox(height: 22.h),
                  _buildPostcodeInputColumn(context),
                  SizedBox(height: 22.h),
                  _buildPhoneInputColumn(context),
                  SizedBox(height: 140.h),
                  CustomElevatedButton(
                    height: 40.h,
                    text: "Save Changes",
                    buttonStyle: CustomButtonStyles.fillPrimary,
                    onPressed: () {
                      // todo: implement save functionality
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          child: _buildBottomNavigationBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCountrySelectionRow(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Country",
                  style: CustomTextStyles.labelLargeNunitoSansBlack900SemiBold,
                ),
                SizedBox(height: 2.h),
                Text(
                  "Choose your country",
                  style: CustomTextStyles.titleLarge20,
                )
              ],
            ),
          ),
          CustomIconButton(
            height: 30.h,
            width: 30.h,
            padding: EdgeInsets.all(6.h),
            decoration: IconButtonStyleHelper.fillPrimary,
            alignment: Alignment.bottomCenter,
            child: CustomImageView(
              imagePath: ImageConstant.imgArrow,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAddressInputColumn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address",
            style: CustomTextStyles.labelLargeNunitoSansBlack900SemiBold,
          ),
          CustomTextFormField(
            controller: fieldoneController,
            hintText: "Required",
            contentPadding: EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 6.h),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCityInputColumn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Town / City",
            style: CustomTextStyles.labelLargeNunitoSansBlack900SemiBold,
          ),
          CustomTextFormField(
            controller: fieldthreeController,
            hintText: "Required",
            contentPadding: EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 6.h),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPostcodeInputColumn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Postcode",
            style: CustomTextStyles.labelLargeNunitoSansBlack900SemiBold,
          ),
          CustomTextFormField(
            controller: fieldfiveController,
            hintText: "Required",
            contentPadding: EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 6.h),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneInputColumn(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Phone Number",
            style: CustomTextStyles.labelLargeNunitoSansBlack900SemiBold,
          ),
          CustomTextFormField(
            controller: fieldsevenController,
            hintText: "Required",
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 6.h),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(
            navigatorKey.currentContext!,
            getCurrentRoute(type),
          );
        },
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.loremipsumdolorsitametconsectetur:
        return AppRoutes.shopInitialPage;
      case BottomBarEnum.loremipsumdolor3:
        return "/";
      default:
        return "/";
    }
  }
}
/// Section Widget
