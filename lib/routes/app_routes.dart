import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/login_screen/login_screen.dart';

class AppRoutes {
  static const String startScreen = '/';
  static const String createAccountScreen = '/create_account_screen';
  static const String loginScreen = '/login_screen';
  static const String passwordScreen = '/password_screen';
  static const String passwordTypingScreen = '/password_typing_screen';
  static const String fullProfilePage = '/full_profile_page';
  static const String shopInitialPage = '/shop_initial_page';
  static const String flashSaleFullScreen = '/flash_sale_full_screen';
  static const String categoriesFilterScreen = '/categories_filter_screen';
  static const String scrollViewTabPage = '/scrollview_tab_page';
  static const String searchResultsScreen = '/search_results_screen';
  static const String imageSearchScreen = '/image_search_screen';
  static const String filterScreen = '/filter_screen';
  static const String productFullScreen = '/product_full_screen';
  static const String reviewsScreen = '/wishlist_screen';
  static const String recentlyViewedScreen = '/recently_viewed_screen';
  static const String cartPage = '/cart_page';
  static const String cartEmptyShownFromWishlistScreen = '/cart_empty_shown_from_wishlist_screen';
  static const String toReceiveScreen = '/to_receive_receive_progress_screen';
  static const String myActivityScreen = '/delivered_screen';
  static const String voucherIsGonnaExpireScreen = '/voucher_is_gonna_expire_screen';
  static const String voucherTabScreen = '/vouchers_tab_page';
  static const String settingsProfileScreen = '/settings_profile_screen';
  static const String settingsAddCardScreen = '/settings_add_card_screen';
  static const String paymentMethodsHistoryScreen = '/payment_methods_history_screen';
  static const String shippingAddressScreen = '/shipping_address_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';
  
   static Map<String, Widget Function(BuildContext)> routes = {
    // startScreen: (context) => StartScreen(),
    // createAccountScreen: (context) => CreateAccountScreen(),
    loginScreen: (context) => LoginScreen(),
    // passwordScreen: (context) => PasswordScreen(),
    // passwordTypingScreen: (context) => PasswordTypingScreen(),
    // fullProfilePage: (context) => FullProfilePage(),
    // shopInitialPage: (context) => ShopInitialPage(),
    // flashSaleFullScreen: (context) => FlashSaleFullScreen(),
    // categoriesFilterScreen: (context) => CategoriesFilterScreen(),
    // scrollViewTabPage: (context) => ScrollViewTabPage(),
    // searchResultsScreen: (context) => SearchResultsScreen(),
    // imageSearchScreen: (context) => ImageSearchScreen(),
    // filterScreen: (context) => FilterScreen(),
    // productFullScreen: (context) => ProductFullScreen(),
    // reviewsScreen: (context) => ReviewsScreen(),
    // recentlyViewedScreen: (context) => RecentlyViewedScreen(),
    // cartPage: (context) => CartPage(),
    // cartEmptyShownFromWishlistScreen: (context) => CartEmptyShownFromWishlistScreen(),
    // toReceiveScreen: (context) => ToReceiveScreen(),
    // myActivityScreen: (context) => MyActivityScreen(),
    // voucherIsGonnaExpireScreen: (context) => VoucherIsGonnaExpireScreen(),
    // voucherTabScreen: (context) => VoucherTabScreen(),
    // settingsProfileScreen: (context) => SettingsProfileScreen(),
    // settingsAddCardScreen: (context) => SettingsAddCardScreen(),
    // paymentMethodsHistoryScreen: (context) => PaymentMethodsHistoryScreen(),
    // shippingAddressScreen: (context) => ShippingAddressScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => LoginScreen(),
  };
}
