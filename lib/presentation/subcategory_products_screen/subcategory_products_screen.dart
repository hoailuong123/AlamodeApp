import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';
import '../../services/product_service.dart';
import '../../presentation/shop_screen/widgets/recommend_item.dart';

class SubCategoryProductsScreen extends StatefulWidget {
  final String subCategoryId; // Change from Category to subCategoryId

  SubCategoryProductsScreen({required this.subCategoryId}); // Updated constructor

  @override
  _SubCategoryProductsScreenState createState() => _SubCategoryProductsScreenState();
}

class _SubCategoryProductsScreenState extends State<SubCategoryProductsScreen> {
  late Future<List<ProductModel>> _futureProducts;
  final ProductService _productService = ProductService();
  late String subCategoryId; // Updated to store subCategoryId

  @override
  void initState() {
    super.initState();
    subCategoryId = widget.subCategoryId; // Initialize from widget
    _futureProducts = _productService.fetchProducts(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subcategory Products'), // Optionally update title
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products available'));
          } else {
            final filteredProducts = snapshot.data!
                .where((product) => product.category == subCategoryId) // Adjusted filtering
                .toList();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: filteredProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return RecommendItemWidget(
                    productName: product.name,
                    productPrice: product.price.toString(),
                    productImage: product.mainImage.toString(),
                    productId: product.id,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}