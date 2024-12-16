import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'widgets/image_item_widgets.dart';
import 'widgets/list_item_widgets.dart';


class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildImageSlider(context),
                    _buildPriceSection(context),
                    _buildDescriptionSection(),
                    _buildVariationsSection(context),
                    _buildSimilarItemsSection(context),
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
            height: 394,
            autoPlay: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              sliderIndex = index;
            },
          ),
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return ImageItemWidget();
          },
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: sliderIndex,
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

  Widget _buildPriceSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$17.00",
            style: CustomTextStyles.titleMediumBlack900Medium,
          ),
          IconButton(
            icon: Icon(Icons.share, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  Widget _buildVariationsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Text(
            "Variations:",
            style: CustomTextStyles.titleLargeBlack900,
          ),
          SizedBox(width: 8),
          Chip(label: Text("Pink")),
          SizedBox(width: 8),
          Chip(label: Text("M")),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        ],
      ),
    );
  }

  Widget _buildSimilarItemsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ListaecaItemWidget(),
              ),
            ),
          ),
        ),
      ],
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
