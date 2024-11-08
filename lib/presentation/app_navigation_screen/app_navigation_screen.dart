import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                color: const Color(0xFFFFFFFF),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                      ),
                      child: Text(
                        "App Navigation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF000000),
                          fontSize: 20.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Divider(
                      height: 1.h,
                      thickness: 1.h,
                      color: const Color(0xFF000000),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: const Color(0xFFFFFFFF),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Start Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.startScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Create Account Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.createAccountScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                         _buildScreenTitle(
                          context,
                          screenTitle: "Setting Full Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.settingsFullScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Shipping Address Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.shippingAddressScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Setting Profile Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.settingsProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Shop Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.shopScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        if (onTapScreenTitle != null) {
          onTapScreenTitle();
        }
      },
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                screenTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Divider(
              height: 1.0,
              thickness: 1.0,
              color: Color(0xFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
