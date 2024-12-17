import 'dart:math';
import 'package:alamodeapp/presentation/product_variation_screen/product_variation_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../services/product_service.dart';
import '../../models/product_model.dart';
import '../../theme/custom_text_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../theme/custom_button_style.dart';
import '/presentation/cart_page/widgets/cart_manager.dart';
import '/presentation/cart_page/cart_page.dart';
import '/presentation/product_variation_screen/product_variation_screen.dart';

class ProductScreen extends StatefulWidget {
  final int productid; // Required product ID

  const ProductScreen({Key? key, required this.productid}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<ProductModel> _productDetailFuture;
  final ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    _productDetailFuture = _productService.fetchProductDetail(widget.productid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
        ),
        body: FutureBuilder<ProductModel>(
          future: _productDetailFuture, 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Failed to load product details"));
            } else if (snapshot.hasData) {
              final product = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageSlider(product),
                    _buildProductInfo(product),
                    _buildDescription(product),
                    _buildDetailsSection(product),
                    _buildBottomBar(product),
                  ],
                ),
              );
            }
            return Center(child: Text("No product data available"));
          },
        ),
      ),
    );
  }

  String calculateDiscount(String originalPrice, String? salePrice) {
    if (salePrice == null || salePrice == "null") return "0";
    double original = double.parse(originalPrice);
    double sale = double.parse(salePrice);
    double discount = ((original - sale) / original) * 100;
    return discount.toStringAsFixed(0);
  }

  Widget _buildImageSlider(ProductModel product) {
    return CarouselSlider.builder(
      itemCount: product.images.length,
      options: CarouselOptions(
        height: 300.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      itemBuilder: (context, index, realIndex) {
        final imageUrl = product.images[index].image;
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) =>
                Image.asset('assets/images/image3.png', fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  Widget _buildProductInfo(ProductModel product) {
    // Helper to calculate discount percentage
    String calculateDiscount(String originalPrice, String? salePrice) {
      if (salePrice == null || salePrice == "null") return "0";
      double original = double.parse(originalPrice);
      double sale = double.parse(salePrice);
      double discount = ((original - sale) / original) * 100;
      return discount.toStringAsFixed(0);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sale Price Section (Only if sale price exists)
          if (product.salePrice != null && product.salePrice != "null") ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sale Price
                Text(
                  "\$${product.salePrice}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                // Discount Percentage
                Text(
                  "-${calculateDiscount(product.price, product.salePrice!)}%",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            // Original Price with Strikethrough
            Text(
              "\$${product.price}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ] else
            // Regular Price (No Sale)
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

          SizedBox(height: 8),

          // Product Name
          Text(
            product.name,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        product.description,
        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
      ),
    );
  }

  Widget _buildDetailsSection(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Details", style: CustomTextStyles.titleLarge20),
          SizedBox(height: 8),
          Text("Brand: ${product.brand}"),
          Text("Material: ${product.material}"),
          Text("Sizes: ${product.sizes}"),
          Text("Colors: ${product.colors}"),
          Text("Weight: ${product.weight} kg"),
        ],
      ),
    );
  }

  Widget _buildBottomBar(ProductModel product) {
    return Container(
      padding: const EdgeInsets.all(16),
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
          Expanded(
  child: CustomElevatedButton(
    text: "Add to Cart",
    buttonStyle: CustomButtonStyles.fillGrayTL10,
    onPressed: () {
      // Navigate to Product Variation Screen with productId
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductVariationScreen(productId: product.id),
        ),
      );
    },
  ),
),

          SizedBox(width: 8),
          Expanded(
            child: CustomElevatedButton(
              text: "Buy Now",
              buttonStyle: CustomButtonStyles.fillPrimary,
              onPressed: () {
                // Handle Buy Now logic
              },
            ),
          ),
        ],
      ),
    );
  }
}
