import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '/presentation/cart_page/widgets/cart_manager.dart';

class CartScreen extends StatelessWidget {
  final List<ProductModel> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text("Your cart is empty!"))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                return ListTile(
                  leading: Image.network(
                    product.mainImage ?? 'assets/images/placeholder.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    product.salePrice != null
                        ? "\$${product.salePrice}"
                        : "\$${product.price}",
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      // Remove item logic
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Checkout logic
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: Text(
            "Proceed to Checkout",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
