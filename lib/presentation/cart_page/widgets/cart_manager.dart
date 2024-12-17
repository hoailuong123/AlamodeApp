import '/models/product_model.dart';


class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;

  CartManager._internal();

  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart({
    required ProductModel product,
    required String selectedSize,
    required String selectedColor,
    required int quantity,
  }) {
    _cartItems.add({
      "product": product,
      "size": selectedSize,
      "color": selectedColor,
      "quantity": quantity,
    });
  }

  void clearCart() {
    _cartItems.clear();
  }
}
