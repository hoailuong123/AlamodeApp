import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/presentation/product_variation_screen/product_variation_screen.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<dynamic>> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems = _fetchCartItems();
  }

  Future<List<dynamic>> _fetchCartItems() async {
  final url = Uri.parse('https://included-sheepdog-slowly.ngrok-free.app/api/cart/detail');
  final token = await _getAccessToken();

  if (token == null) {
    throw Exception("User not authenticated");
  }

  try {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      // Extract the 'items' key
      if (jsonData.containsKey('items')) {
        return jsonData['items'] as List<dynamic>;
      } else {
        throw Exception("No items found in response.");
      }
    } else {
      throw Exception("Failed to fetch cart items: ${response.statusCode}");
    }
  } catch (e) {
    print("Error fetching cart: $e");
    throw Exception("Error fetching cart items: $e");
  }
}




  Future<String?> _getAccessToken() async {
    // Replace this with your token fetching logic
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _cartItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items[index];
                return ListTile(
                  leading: Image.network(product['image'] ?? ''),
                  title: Text(product['name']),
                  subtitle: Text("\$${product['price']}"),
                  trailing: Text("Qty: ${product['quantity']}"),
                );
              },
            );
          }
          return Center(child: Text("No items in cart."));
        },
      ),
    );
  }
}
