import 'package:alamodeapp/routes/app_routes.dart';
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
        if (!map.containsKey(category.id)) {
          map[category.id] = [];
        }
      } else {
        if (!map.containsKey(category.parent)) {
          // Handle case where parent does not exist
          map[category.parent!] = [];
        }
        map[category.parent!]!.add(category);
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
          ? [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 3.5,
                  children: subCategories
                      .map((subCat) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.subCategoryProductsScreen, 
                                arguments: subCat,
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Color(0xFFFFEBEB),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Center(
                                child: Text(subCat.name),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ]
          : [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("No Subcategories"),
              )
            ],
    );
  }
}
