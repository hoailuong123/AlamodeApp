import 'package:flutter/material.dart';
import '../../services/category_service.dart';
import '../../models/category_model.dart';

class CategoriesFilterScreen extends StatefulWidget {
  @override
  _CategoriesFilterScreenState createState() => _CategoriesFilterScreenState();
}

class _CategoriesFilterScreenState extends State<CategoriesFilterScreen> {
  final CategoryService _categoryService = CategoryService();
  List<Category> _categories = [];
  Map<int, List<Category>> _categoryMap = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      final categories = await _categoryService.fetchCategories();
      _processCategories(categories);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error fetching categories: $e");
    }
  }

  void _processCategories(List<Category> categories) {
    Map<int, List<Category>> map = {};
    for (var category in categories) {
      if (category.parent == null) {
        map[category.id] = [];
      } else {
        map[category.parent]?.add(category);
      }
    }
    setState(() {
      _categories = categories.where((cat) => cat.parent == null).toList();
      _categoryMap = map;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _buildCategoryList(),
    );
  }

  Widget _buildCategoryList() {
    return ListView.builder(
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return _buildCategoryItem(category);
      },
    );
  }

  Widget _buildCategoryItem(Category category) {
    final subCategories = _categoryMap[category.id] ?? [];

    return ExpansionTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(category.image),
        radius: 24,
      ),
      title: Text(
        category.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: subCategories.isNotEmpty
          ? subCategories
          .map((subCat) => ListTile(
        leading: Icon(Icons.arrow_right, color: Colors.blue),
        title: Text(subCat.name),
      ))
          .toList()
          : [Text("No Subcategories")],
    );
  }
}
