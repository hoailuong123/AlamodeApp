import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_icon_button.dart';
import 'shop_initial_page.dart';
// ignore_for_file: must_be_immutable
class ShopScreen extends StatelessWidget {
  ShopScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Navigator(
        key: navigatorKey,
        initialRoute: AppRoutes.shopInitialPage,
        onGenerateRoute: (routeSetting) => PageRouteBuilder(
          pageBuilder: (ctx, ani, ani1) =>
              getCurrentPage(routeSetting.name!),
          transitionDuration: const Duration(seconds: 0),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomBar(context),
      ),
    ));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(
              navigatorKey.currentContext!, getCurrentRoute(type));
        },
      ),
    );
  }
  /// Common widget
Widget buildMostPopularSection(
  BuildContext context, {
  required String titleText,
  required String seeAllText,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          titleText,
          style: theme.textTheme.titleLarge!.copyWith(
            color: appTheme.gray900,
          ),
        ),
      ),
      Spacer(),
      Padding(
        padding: EdgeInsets.only(top: 6.h),
        child: Text(
          seeAllText,
          style: CustomTextStyles.titleSmall15.copyWith(
            color: appTheme.gray900,
          ),
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

///Handling page based on route
Widget getCurrentPage(String currentRoute) {
  switch (currentRoute) {
    case AppRoutes.shopInitialPage:
      return ShopInitialPage();
    default:
      return DefaultWidget();
  }
}
}
