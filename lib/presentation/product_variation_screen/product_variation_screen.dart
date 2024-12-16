import 'package:alamodeapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/item_widget.dart';
import 'widgets/list_item_widget.dart';
import 'widgets/list_option_widget.dart';
import '../../core/app_export.dart';

class ProductVariationScreen extends StatefulWidget {
  ProductVariationScreen({Key? key}) : super(key: key);

  @override
  State<ProductVariationScreen> createState() => _ProductVariationScreenState();
}

class _ProductVariationScreenState extends State<ProductVariationScreen> {
  int selectedColorIndex = 0;

  int selectedSizeIndex = 1;

  int quantity = 1;

  final List<String> sizes = ["S", "M", "L", "XL", "XXL", "XXXL"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageSlider(context),
                    _buildPriceAndVariationSection(context),
                    _buildColorOptions(context),
                    _buildSizeOptions(context),
                    _buildQuantitySelector(context),
                  ],
                ),
              ),
            ),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            viewportFraction: 1.0,
          ),
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return CustomImageView(
              imagePath: ImageConstant.imgProduct4,
            );
          },
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: 0,
              count: 3,
              effect: ScrollingDotsEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey.withOpacity(0.5),
                dotHeight: 8.0,
                dotWidth: 8.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndVariationSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgProfile,
            height: 80,
            width: 80,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$17,00",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  ChipviewcolorItemWidget(),
                  SizedBox(width: 8),
                  ChipviewcolorItemWidget(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorOptions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Color Options",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ListOptionWidget(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSizeOptions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Size",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              sizes.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSizeIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedSizeIndex == index
                        ? Colors.blue
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    sizes[index],
                    style: TextStyle(
                      color: selectedSizeIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Quantity",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 1) quantity--;
                },
              ),
              Text(
                "$quantity",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  quantity++;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  
  Widget _buildBottomBar(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.grey),
            onPressed: () {},
          ),
          SizedBox(width: 8),
          Expanded(
            child: CustomElevatedButton(
              text: "Add to cart",
              buttonStyle: CustomButtonStyles.fillGrayTL10,
              onPressed: () {},
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: CustomElevatedButton(
              text: "Buy now",
              buttonStyle: CustomButtonStyles.fillPrimary,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
