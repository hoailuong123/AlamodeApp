import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../services/product_service.dart';
import '../../models/product_model.dart';
import '../../theme/custom_text_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../theme/custom_button_style.dart';

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
                    _buildBottomBar(),
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$${product.price}",
            style: CustomTextStyles.titleLargeBlack900,
          ),
          Text(
            "Stock: ${product.stock}",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
          Text("Product Details", style: CustomTextStyles.titleMediumBlack900Medium),
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

  Widget _buildBottomBar() {
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
                // Handle Add to Cart logic
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
