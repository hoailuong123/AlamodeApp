// lib/presentation/shop_screen/shop_initial_page.dart

import 'package:alamodeapp/services/product_service.dart';
import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_appbar.dart';
import '../../widgets/app_bar/appbar_title_searchview_three.dart';
import '../../widgets/custom_icon_button.dart';
import 'widgets/grid_categories.dart';
import 'widgets/grid_new_item.dart';
import 'widgets/grid_sale_item.dart';
import 'widgets/most_popular.dart';
import 'widgets/one_item.dart';
import 'widgets/recommend_item.dart';
import 'widgets/slider_item.dart'; 
import '/services/category_service.dart'; 
import '/models/product_model.dart'; 

class ShopInitialPage extends StatefulWidget {
  const ShopInitialPage({Key? key}) : super(key: key);

  @override
  ShopInitialPageState createState() => ShopInitialPageState();
}

class ShopInitialPageState extends State<ShopInitialPage> {

  TextEditingController searchController = TextEditingController();
  int sliderIndex = 0; 
  final ProductService _productService = ProductService();
  late Future<ProductListResponse> _recommendedProductsFuture;

  @override

  void initState() {
    super.initState();
    // _recommendedProductsFuture = _productService.fetchProducts(pageSize: 10, page: 1);
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: _buildAppBar(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    _buildBigSaleBanner(context),
                    SizedBox(height: 18.h),
                    GridCategories(),
                    SizedBox(height: 28.h),
                    _buildTopProductsSection(context),
                    SizedBox(height: 48.h),
                    _buildNewItemsSection(context),
                    SizedBox(height: 24.h),
                    _buildFlashSaleSection(context),
                    SizedBox(height: 24.h),
                    _buildJustForYouSection(context),
                    SizedBox(height: 26.h),
                    _buildRowtitlenine(context),
                    SizedBox(height: 10.h),
                    _buildRecommendedProductsGrid(context)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildMostPopularSection(
      BuildContext context, {
        required String titleText
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
          // child: Text(
          //   seeAllText,
          //   style: CustomTextStyles.titleSmall15.copyWith(
          //     color: appTheme.gray900,
          //   ),
          // ),
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
            // child: CustomImageView(
            //   imagePath: ImageConstant.imgArrow,
            // ),
            // onTap: () { 
            //   Navigator.pushNamed(context, AppRoutes.seeAllProductsPage);
            // },
          ),
        )
      ],
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 19.h,
        ),
        child: Row(
          children: [
            AppbarTitle(
              text: "Shop",
              margin: EdgeInsets.only(top: 2.h),
            ),
            Expanded(
              child: AppbarTitleSearchviewThree(
                margin: EdgeInsets.only(
                  left: 19.h,
                  bottom: 2.h,
                ),
                hintText: "Search",
                controller: searchController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBigSaleBanner(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: 130.h,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    sliderIndex = index;
                  });
                },
              ),
              itemCount: 1,
              itemBuilder: (context, index, realIndex) {
                return SliderItem();
              },
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 10.h,
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
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTopProductsSection(BuildContext context) {
  return FutureBuilder<List<ProductModel>>(
    future: _productService.fetchProducts(pageSize: 5, page: 1), 
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text("Failed to load top products."));
      } else if (snapshot.hasData) {
        final topProducts = snapshot.data!;
        return Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Products",
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(height: 8.h),
              Container(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 8.h,
                    children: topProducts.map((product) {
                      return OneItemWidget(
                        product: product, 
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.productScreen, 
                            arguments: product, 
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return SizedBox.shrink();
    },
  );
}

  /// Section Widget: New Items
Widget _buildNewItemsSection(BuildContext context) {
  return FutureBuilder<List<ProductModel>>(
    future: _productService.fetchNearestProducts(limit: 5), 
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(
          child: Text(
            "Failed to load new items.",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        );
      } else if (snapshot.hasData) {
        final products = snapshot.data!;

        return SizedBox(
          width: double.maxFinite,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(right: 8.h),
                    child: _buildMostPopularSection(
                      context,
                      titleText: "New Items",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: products.map((product) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8.h),
                          child: GridNewItemWidget(
                            imageUrl: product.mainImage.toString(),
                            productName: product.name,
                            productPrice: product.price.toString(),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return SizedBox(); 
    },
  );
}


  /// Section Widget
  Widget _buildFlashSaleSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(children: [
        SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Flash Sale",
                style: theme.textTheme.titleLarge,
              ),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.img,
                height: 18.h,
                width: 18.h,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 2.h),
              ),
              Container(
                width: 32.h,
                height: 26.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10.h),
                decoration: BoxDecoration(
                  color: appTheme.gray10001,
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Text(
                  "00",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Container(
                width: 32.h,
                height: 26.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: appTheme.gray10001,
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Text(
                  "36",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Container(
                width: 32.h,
                height: 26.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: appTheme.gray10001,
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Text(
                  "58",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        ResponsiveGridListBuilder(
          minItemWidth: 1,
          minItemsPerRow: 3,
          maxItemsPerRow: 3,
          horizontalGridMargin: 4.h,
          verticalGridMargin: 4.h,
          builder: (context, items) => ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            children: items,
          ),
          gridItems: List.generate(
            6,
                (index) {
              return GridSaleItemWidget();
            },
          ),
        )
      ]),
    );
  }

  /// Section Widget
  Widget _buildJustForYouSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 8.h),
                child: _buildMostPopularSection(
                  context,
                  titleText: "Most Popular"
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
                        return MostPopularItemWidget();
                      },
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

  /// Section Widget
  Widget _buildRowtitlenine(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Just For You",
              style: theme.textTheme.titleLarge,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget: Recommended Products Grid
Widget _buildRecommendedProductsGrid(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.h),
    child: FutureBuilder<List<ProductModel>>(
      future: _productService.fetchProducts(pageSize: 10, page: 1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Loading state
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Failed to load products.",
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ); // Error state
        } else if (snapshot.hasData) {
          final products = snapshot.data!;
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6, // Limit height
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true, 
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                mainAxisSpacing: 12.0, // Spacing between rows
                crossAxisSpacing: 12.0, // Spacing between columns
                childAspectRatio: 0.8, // Adjust child size
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return RecommendItemWidget(
                  productName: product.name,
                  productPrice: product.price.toString(),
                  productImage: product.mainImage.toString() 
                );
              },
            ),
          );
        }
        return SizedBox.shrink(); 
      },
    ),
  );
}




}
