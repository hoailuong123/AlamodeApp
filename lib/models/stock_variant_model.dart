class StockModel {
  final int id;
  final String name;
  final String description;
  final bool isActive;
  final String location;
  final DateTime createdAt;
  final DateTime updatedAt;

  StockModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isActive,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isActive: json['is_active'],
      location: json['location'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class StockVariantModel {
  final int id;
  final int product;
  final StockModel stock;
  final String variantName;
  final int quantity;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? image;

  StockVariantModel({
    required this.id,
    required this.product,
    required this.stock,
    required this.variantName,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    this.image,
  });

  factory StockVariantModel.fromJson(Map<String, dynamic> json) {
    return StockVariantModel(
      id: json['id'],
      product: json['product'],
      stock: StockModel.fromJson(json['stock']),
      variantName: json['variant_name'],
      quantity: json['quantity'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      image: json['image'],
    );
  }
}
