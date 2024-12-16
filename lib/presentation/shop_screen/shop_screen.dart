import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../categories_filter_screen/categories_filter_screen.dart';
import 'shop_initial_page.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.shopInitialPage,
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => getCurrentPage(routeSettings.name!),
            );
          },
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Bottom Navigation Bar
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        String route = getCurrentRoute(type);
        if (route.isNotEmpty && route != ModalRoute.of(context)?.settings.name) {
          Navigator.pushNamed(navigatorKey.currentContext!, route);
        }
      },
    );
  }

  /// Mapping routes for bottom navigation bar
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.loremipsumdolorsitametconsectetur:
        return AppRoutes.shopInitialPage;
      case BottomBarEnum.loremipsumdolor3:
        return AppRoutes.categoriesFilterScreen; // Example route
      default:
        return '';
    }
  }

  /// Mapping widgets for respective routes
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.shopInitialPage:
        return ShopInitialPage();
      case AppRoutes.categoriesFilterScreen:
        return CategoriesFilterScreen(); // Ensure this screen is implemented
      default:
        return Center(
          child: Text(
            'Page Not Found',
            style: TextStyle(fontSize: 18),
          ),
        );
    }
  }
}
