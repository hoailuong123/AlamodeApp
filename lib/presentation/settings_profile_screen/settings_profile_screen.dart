import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SettingsProfileScreen extends StatelessWidget {
  SettingsProfileScreen({Key? key}) : super(key: key);

  TextEditingController nameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: SizeUtils.height,
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(20.h),
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
                    "Your Profile",
                    style: CustomTextStyles.titleMediumBlack900Medium16,
                  ),
                  SizedBox(height: 18.h),
                  CustomImageView(
                    imagePath: ImageConstant.imgProfile,
                    height: 104.h,
                    width: 106.h,
                  ),
                  SizedBox(height: 20.h),
                  _buildNameInput(context),
                  SizedBox(height: 10.h),
                  _buildEmailInput(context),
                  SizedBox(height: 10.h),
                  _buildPasswordInput(context),
                  Spacer(),
                  _buildSaveChangesButton(context)
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
  Widget _buildNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: nameInputController,
      hintText: "Romina",
      hintStyle: CustomTextStyles.bodyLargeRalewayBlack900,
      contentPadding: EdgeInsets.fromLTRB(18.h, 14.h, 18.h, 12.h),
    );
  }

  /// Section Widget
  Widget _buildEmailInput(BuildContext context) {
    return CustomTextFormField(
      controller: emailInputController,
      hintText: "gmail@example.com",
      hintStyle: CustomTextStyles.titleMediumBlack900Medium_2,
      textInputType: TextInputType.emailAddress,
      contentPadding: EdgeInsets.fromLTRB(18.h, 14.h, 18.h, 12.h),
    );
  }

  /// Section Widget
  Widget _buildPasswordInput(BuildContext context) {
    return CustomTextFormField(
      controller: passwordInputController,
      hintText: "************",
      hintStyle: CustomTextStyles.titleMediumBlack900Medium_2,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      contentPadding: EdgeInsets.fromLTRB(18.h, 14.h, 18.h, 12.h),
    );
  }

  /// Section Widget
  Widget _buildSaveChangesButton(BuildContext context) {
    return CustomElevatedButton(
      height: 40.h,
      text: "Save Changes",
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  /// Section Widget
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
