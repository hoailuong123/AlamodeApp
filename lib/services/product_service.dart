import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  final String baseUrl = 'https://sterling-notably-monster.ngrok-free.app';

  Future<ProductListResponse> fetchProducts({int pageSize = 5, int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl/api/product/list/?page_size=$pageSize&page=$page'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProductListResponse.fromJson(data);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
