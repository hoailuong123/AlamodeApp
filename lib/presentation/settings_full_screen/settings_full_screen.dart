import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_appbar.dart';
import '../../presentation/settings_full_screen/widgets/deleting_account_diaglog.dart';

class SettingsFullScreen extends StatelessWidget {
  const SettingsFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 18.0, top: 14.0, right: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal",
                    style: CustomTextStyles.titleLargeExtraBold,
                  ),
                  SizedBox(height: 30.0),
                  SizedBox(
                    width: double.maxFinite,
                    child: _buildShippingAddressSection(
                      context,
                      shippingAddressTitle: "Profile",
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.settingsProfileScreen,
                      ),
                    ),
                  ),
                  SizedBox(height: 46.0),
                  SizedBox(
                    width: double.maxFinite,
                    child: _buildShippingAddressSection(
                      context,
                      shippingAddressTitle: "Shipping Address",
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.shippingAddressScreen,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    "Account",
                    style: CustomTextStyles.titleLargeExtraBold,
                  ),
                  SizedBox(height: 38.0),
                  SizedBox(
                    width: double.maxFinite,
                    child: _buildShippingAddressSection(
                      context,
                      shippingAddressTitle: "About Bi Ro",
                    ),
                  ),
                  SizedBox(height: 30.0),
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DeletingAccountDialog();
                      },
                    ),
                    child: Text(
                      "Delete My Account",
                      style: CustomTextStyles.labelLargeRed300,
                    ),
                  ),
                  SizedBox(height: 260.0),
                  Text(
                    "Bi Ro",
                    style: CustomTextStyles.titleLargeExtraBold,
                  ),
                  Text(
                    "Version 1.0 October, 2024",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 14.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "Settings",
        margin: EdgeInsets.only(left: 20.h),
      ),
    );
  }

  Widget _buildShippingAddressSection(
    BuildContext context, {
    required String shippingAddressTitle,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            shippingAddressTitle,
            style: CustomTextStyles.titleMediumNunitoSansBlack900.copyWith(
              color: appTheme.black900,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.btnArrowRight,
            height: 16.h,
            width: 10.h,
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencySection(
    BuildContext context, {
    required String currencyTitle,
    required String currencyPrice,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            currencyTitle,
            style: CustomTextStyles.titleMediumNunitoSansBlack900.copyWith(
              color: appTheme.black900,
            ),
          ),
          const Spacer(),
          Text(
            currencyPrice,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: appTheme.black900,
                ),
          ),
          CustomImageView(
            imagePath: ImageConstant.btnArrowRight,
            height: 16.0,
            width: 10.0,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 16.0),
          ),
        ],
      ),
    );
  }
}
