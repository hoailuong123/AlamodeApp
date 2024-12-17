import 'package:alamodeapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/item_widget.dart';
import 'widgets/list_item_widget.dart';
import 'widgets/list_option_widget.dart';
import '../../core/app_export.dart';
import '/services/product_service.dart';
import '/models/product_model.dart';
import '/presentation/cart_page/widgets/cart_manager.dart';


class ProductVariationScreen extends StatefulWidget {
  final int productId;

  const ProductVariationScreen({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductVariationScreen> createState() => _ProductVariationScreenState();
}

class _ProductVariationScreenState extends State<ProductVariationScreen> {
  late Future<ProductModel> _productDetail;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 1;
  int quantity = 1;

  final List<String> sizes = ["S", "M", "L", "XL", "XXL", "XXXL"];
  final ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    _productDetail = _productService.fetchProductDetail(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<ProductModel>(
          future: _productDetail,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Failed to load product details"));
            } else if (snapshot.hasData) {
              final product = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildImageSlider(context, product),
                          _buildPriceAndVariationSection(context, product),
                          _buildColorOptions(context),
                          _buildSizeOptions(context),
                          _buildQuantitySelector(context),
                        ],
                      ),
                    ),
                  ),
                  _buildBottomBar(context, product),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildImageSlider(BuildContext context, ProductModel product) {
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(height: 300, autoPlay: true, viewportFraction: 1.0),
          itemCount: product.images.length,
          itemBuilder: (context, index, realIndex) {
            return Image.network(
              product.images[index].image,
              fit: BoxFit.cover,
            );
          },
        ),
      ],
    );
  }

  Widget _buildPriceAndVariationSection(BuildContext context, ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "\$${product.salePrice ?? product.price}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          if (product.salePrice != null) // Show original price if sale is active
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: 18,
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          SizedBox(height: 8),
          Text(product.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
          child: Text("Color Options", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Row(
          children: List.generate(
            4,
            (index) => GestureDetector(
              onTap: () => setState(() => selectedColorIndex = index),
              child: Container(
                margin: EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedColorIndex == index ? Colors.blue : Colors.transparent,
                  ),
                ),
                child: Image.network(
                  'https://via.placeholder.com/50', // Replace with actual color image
                  width: 50,
                  height: 50,
                ),
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
          child: Text("Size", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Row(
          children: List.generate(
            sizes.length,
            (index) => GestureDetector(
              onTap: () => setState(() => selectedSizeIndex = index),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: selectedSizeIndex == index ? Colors.blue : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  sizes[index],
                  style: TextStyle(
                    color: selectedSizeIndex == index ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
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
          Text("Quantity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => setState(() => quantity = (quantity > 1) ? quantity - 1 : 1),
              ),
              Text("$quantity", style: TextStyle(fontSize: 18)),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => setState(() => quantity++),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, ProductModel product) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          CartManager().addToCart(
            product: product,
            selectedSize: sizes[selectedSizeIndex],
            selectedColor: "Pink", // Replace with dynamic color
            quantity: quantity,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Product added to cart")),
          );
        },
        child: Text("Add to Cart", style: TextStyle(fontSize: 16, color: Colors.white)),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
      ),
    );
  }
}

