import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryService {
  final String baseUrl = 'https://included-sheepdog-slowly.ngrok-free.app';

  Future<List<Category>> fetchCategories() async {
    List<Category> allCategories = [];
    int page = 1;
    bool hasMore = true;

    while (hasMore) {
      final response =
          await http.get(Uri.parse('$baseUrl/api/categories/?page=$page'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> results = data['results'];
        allCategories
            .addAll(results.map((json) => Category.fromJson(json)).toList());

        if (data['next'] == null) {
          hasMore = false;
        } else {
          page++;
        }
      } else {
        throw Exception('Failed to load categories');
      }
    }

    // Ensure that all parents are included
    final parentIds = allCategories
        .where((category) => category.parent != null)
        .map((category) => category.parent!)
        .toSet();
    final missingParents = allCategories.where((cat) => parentIds.contains(cat.id) == false && parentIds.contains(cat.id));


    return allCategories;
  }

  /// Thêm phương thức để lấy danh mục con của một danh mục cha
  Future<List<Category>> fetchSubCategories(int parentId) async {
    List<Category> subCategories = [];
    int page = 1;
    bool hasMore = true;

    while (hasMore) {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/api/categories/$parentId/sub-categories/?page=$page'),
      );

      print(
          'Fetching subcategories for parentId=$parentId, page=$page'); // Thêm log

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> results = data['results'];
        subCategories.addAll(
          results.map((json) => Category.fromJson(json)).toList(),
        );

        if (data['next'] == null) {
          hasMore = false;
        } else {
          page++;
        }
      } else {
        throw Exception('Failed to load subcategories');
      }
    }
    return subCategories;
  }
}
