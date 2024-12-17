import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  final String baseUrl = "https://included-sheepdog-slowly.ngrok-free.app";

  Future<List<ProductModel>> fetchProducts(
      {int pageSize = 10, int page = 1}) async {
    final url =
        Uri.parse('$baseUrl/api/product/list/?page_size=$pageSize&page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      return results.map((productJson) {
        return ProductModel.fromJson(productJson);
      }).toList();
    } else {
      throw Exception("Failed to load products.");
    }
  }

  Future<List<ProductModel>> fetchNearestProducts({int limit = 5}) async {
    final url = Uri.parse('$baseUrl/api/product/list/?page_size=50');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      List<ProductModel> allProducts = results.map((productJson) {
        return ProductModel.fromJson(productJson);
      }).toList();

      allProducts.sort(
          (a, b) => double.parse(a.price).compareTo(double.parse(b.price)));

      return allProducts.take(limit).toList();
    } else {
      throw Exception("Failed to load products.");
    }
  }

  Future<ProductModel> fetchProductDetail(int productId) async {
    final url = Uri.parse('$baseUrl/api/product/detail/$productId/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProductModel.fromJson(data);
    } else {
      throw Exception("Failed to load product details");
    }
  }

  Future<List<ProductModel>> fetchSaleProducts({int limit = 10}) async {
    final url = Uri.parse('$baseUrl/api/product/list/?page_size=50');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List;

      List<ProductModel> allProducts = results.map((productJson) {
        return ProductModel.fromJson(productJson);
      }).toList();

      List<ProductModel> saleProducts = allProducts.where((product) {
        return product.salePrice != null && product.salePrice != "null";
      }).toList();

      return saleProducts.take(limit).toList();
    } else {
      throw Exception("Failed to load sale products.");
    }
  }

  Future<List<ProductModel>> fetchProductsBySubCategory(
      int subCategoryId) async {
    final url = Uri.parse('$baseUrl/api/categories/$subCategoryId/products/');
    print(
        'Fetching products for SubCategory ID: $subCategoryId from URL: $url'); // Thêm logging
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> results;

      // Kiểm tra nếu phản hồi là đối tượng paginated với 'results'
      if (data is Map<String, dynamic> && data.containsKey('results')) {
        results = data['results'];
      }
      // Nếu phản hồi là một mảng JSON trực tiếp
      else if (data is List) {
        results = data;
      }
      // Xử lý các định dạng phản hồi không mong đợi
      else {
        throw Exception('Unexpected API response format');
      }

      print('Fetched ${results.length} products'); // Thêm logging
      return results.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
