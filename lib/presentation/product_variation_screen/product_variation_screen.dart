import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '/services/product_service.dart';
import '/models/product_model.dart';
import '/widgets/custom_elevated_button.dart';

class ProductVariationScreen extends StatefulWidget {
  final int productId;

  const ProductVariationScreen({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductVariationScreen> createState() => _ProductVariationScreenState();
}

class _ProductVariationScreenState extends State<ProductVariationScreen> {
  late Future<ProductModel> _productDetail;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  int quantity = 1;

  final List<String> sizes = ["S", "M", "L", "XL", "XXL", "XXXL"];
  final List<String> colors = ["Red", "Blue", "Green", "Yellow"];
  final ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    _productDetail = _productService.fetchProductDetail(widget.productId);
  }

  // Hàm lấy token từ SharedPreferences
  Future<String?> _getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  // Hàm thêm sản phẩm vào giỏ hàng
  Future<void> _addToCart(ProductModel product) async {
    final url = 'https://included-sheepdog-slowly.ngrok-free.app/api/cart/create/';
    final payload = {
      "product": product.id,
      "quantity": quantity,
      "size": sizes[selectedSizeIndex],
      "color": colors[selectedColorIndex],
    };

    try {
      final token = await _getAccessToken(); // Lấy token từ SharedPreferences

      if (token == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User is not authenticated. Please login again.')),
        );
        return;
      }

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Thêm Bearer Auth vào header
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product added to cart successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add product to cart.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Product Details")),
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
                          _buildImageSlider(product),
                          _buildPriceSection(product),
                          _buildColorOptions(),
                          _buildSizeOptions(),
                          _buildQuantitySelector(),
                        ],
                      ),
                    ),
                  ),
                  _buildBottomBar(product),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildImageSlider(ProductModel product) {
    return CarouselSlider.builder(
      itemCount: product.images.length,
      options: CarouselOptions(height: 300, autoPlay: true),
      itemBuilder: (context, index, realIndex) {
        return Image.network(
          product.images[index].image,
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildPriceSection(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "\$${product.salePrice ?? product.price}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          if (product.salePrice != null)
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          SizedBox(height: 8),
          Text(product.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildColorOptions() {
    return _buildOptionsSection(
      title: "Color Options",
      options: colors,
      selectedIndex: selectedColorIndex,
      onTap: (index) => setState(() => selectedColorIndex = index),
    );
  }

  Widget _buildSizeOptions() {
    return _buildOptionsSection(
      title: "Size Options",
      options: sizes,
      selectedIndex: selectedSizeIndex,
      onTap: (index) => setState(() => selectedSizeIndex = index),
    );
  }

  Widget _buildOptionsSection({
    required String title,
    required List<String> options,
    required int selectedIndex,
    required void Function(int) onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Row(
          children: List.generate(
            options.length,
                (index) => GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: selectedIndex == index ? Colors.blue : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  options[index],
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.black,
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

  Widget _buildQuantitySelector() {
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
                onPressed: () => setState(() {
                  if (quantity > 1) quantity--;
                }),
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

  Widget _buildBottomBar(ProductModel product) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomElevatedButton(
        text: "Add to Cart",
        onPressed: () => _addToCart(product),
      ),
    );
  }
}
