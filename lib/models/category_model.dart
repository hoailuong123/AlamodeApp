class Category {
  final int id;
  final String name;
  final int? parent;
  final String slug;
  final String description;
  final String image;
  final bool isActive;
  final String metaTitle;
  final String metaDescription;
  final int sortOrder;
  final int productPublic;
  final int subcategoryCount;

  Category({
    required this.id,
    required this.name,
    this.parent,
    required this.slug,
    required this.description,
    required this.image,
    required this.isActive,
    required this.metaTitle,
    required this.metaDescription,
    required this.sortOrder,
    required this.productPublic,
    required this.subcategoryCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      parent: json['parent'] != null
          ? json['parent'] as int
          : null, 
      slug: json['slug'],
      description: json['description'],
      image: json['image'],
      isActive: json['is_active'],
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      sortOrder: json['sort_order'],
      productPublic: json['product_public'],
      subcategoryCount: json['subcategory_count'],
    );
  }
}
