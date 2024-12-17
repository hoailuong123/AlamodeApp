import 'image_model.dart';
import 'stock_variant_model.dart';

class ProductModel {
  final int id;
  final String user;
  final String name;
  final String slug;
  final String sku;
  final String? barcode;
  final String brand;
  final String description;
  final String material;
  final String careInstructions;
  final int category;
  final String price;
  final String? salePrice;
  final String? startSaleDate;
  final String? endSaleDate;
  final int stock;
  final String weight;
  final String dimensions;
  final String sizes;
  final String colors;
  final String status;
  final bool isFeatured;
  final bool isNewArrival;
  final bool isOnSale;
  final String? mainImage;
  final String? videoUrl;
  final String metaTitle;
  final String metaDescription;
  final List<ImageModel> images;
  final List<StockVariantModel> stockVariants;
  final List<dynamic> tags;

  ProductModel({
    required this.id,
    required this.user,
    required this.name,
    required this.slug,
    required this.sku,
    this.barcode,
    required this.brand,
    required this.description,
    required this.material,
    required this.careInstructions,
    required this.category,
    required this.price,
    this.salePrice,
    this.startSaleDate,
    this.endSaleDate,
    required this.stock,
    required this.weight,
    required this.dimensions,
    required this.sizes,
    required this.colors,
    required this.status,
    required this.isFeatured,
    required this.isNewArrival,
    required this.isOnSale,
    this.mainImage,
    this.videoUrl,
    required this.metaTitle,
    required this.metaDescription,
    required this.images,
    required this.stockVariants,
    required this.tags,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var imagesFromJson = json['images'] as List;
    List<ImageModel> imageList =
        imagesFromJson.map((i) => ImageModel.fromJson(i)).toList();

    String extractedMainImage = '';
    if (json['images'] != null && json['images'] is List) {
      final images = json['images'] as List;
      final mainImage = images.firstWhere(
        (img) => img['is_main'] == true,
        orElse: () => null,
      );
      extractedMainImage = mainImage != null ? mainImage['image'] : '';
    }
    String calculateDiscount(String originalPrice, String salePrice) {
      double original = double.parse(originalPrice);
      double sale = double.parse(salePrice);
      double discount = ((original - sale) / original) * 100;
      return discount.toStringAsFixed(0);
    }

    var stockVariantsFromJson = json['stock_variants'] as List;
    List<StockVariantModel> stockVariantList = stockVariantsFromJson
        .map((sv) => StockVariantModel.fromJson(sv))
        .toList();

    return ProductModel(
      id: json['id'],
      user: json['user'],
      name: json['name'],
      slug: json['slug'],
      sku: json['sku'],
      barcode: json['barcode'],
      brand: json['brand'],
      description: json['description'],
      material: json['material'],
      careInstructions: json['care_instructions'],
      category: json['category'],
      price: json['price'],
      salePrice: json['sale_price'],
      startSaleDate: json['start_sale_date'],
      endSaleDate: json['end_sale_date'],
      stock: json['stock'],
      weight: json['weight'],
      dimensions: json['dimensions'],
      sizes: json['sizes'],
      colors: json['colors'],
      status: json['status'],
      isFeatured: json['is_featured'],
      isNewArrival: json['is_new_arrival'],
      isOnSale: json['is_on_sale'],
      // mainImage: json['main_image'],
      videoUrl: json['video_url'],
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      images: imageList,
      stockVariants: stockVariantList,
      tags: json['tags'],
      mainImage: extractedMainImage.isNotEmpty
          ? extractedMainImage
          : 'assets/images/placeholder.png', // Fallback placeholder
    );
  }
}

class ProductListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<ProductModel> results;

  ProductListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    var resultsFromJson = json['results'] as List;
    List<ProductModel> productList =
        resultsFromJson.map((p) => ProductModel.fromJson(p)).toList();

    return ProductListResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: productList,
    );
  }
}
