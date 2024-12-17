import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  final String baseUrl = "http://sterling-notably-monster.ngrok-free.app";

  Future<List<ProductModel>> fetchProducts({int pageSize = 10, int page = 1}) async {
    final url = Uri.parse('$baseUrl/api/product/list/?page_size=$pageSize&page=$page');
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
}
