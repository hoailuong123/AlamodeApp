import 'package:alamodeapp/presentation/payment_screen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/presentation/payment_screen/widgets/list_product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<dynamic>> _cartItems;
  double _total = 0.0;

  @override
  void initState() {
    super.initState();
    _cartItems = _fetchCartItems();
  }

  Future<String?> _getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<List<dynamic>> _fetchCartItems() async {
    final url = Uri.parse(
        'https://included-sheepdog-slowly.ngrok-free.app/api/cart/detail/');
    final token = await _getAccessToken();

    if (token == null) throw Exception("User not authenticated");

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey('items')) {
          setState(() {
            _total = jsonData['items']
                .fold(0.0, (sum, item) => sum + 17.0 * item['quantity']);
          });
          return jsonData['items'] as List<dynamic>;
        } else {
          throw Exception("No items found in cart.");
        }
      } else {
        throw Exception("Failed to fetch cart items: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching cart items: $e");
    }
  }

  void _incrementQuantity(Map<String, dynamic> product) {
    setState(() {
      product['quantity']++;
      _total += 17.0; // Giá tạm thời cố định
    });
  }

  void _decrementQuantity(Map<String, dynamic> product) {
    if (product['quantity'] > 1) {
      setState(() {
        product['quantity']--;
        _total -= 17.0;
      });
    }
  }

  Widget _buildCartItem(Map<String, dynamic> product) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Hình ảnh sản phẩm
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                    'https://included-sheepdog-slowly.ngrok-free.app/${product['image']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          // Thông tin sản phẩm
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['product_name'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text("${product['color']}, Size ${product['size']}",
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                Text(
                  "\$17.00", // Giá tạm thời cố định
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Nút tăng/giảm số lượng
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_circle_outline, color: Colors.blue),
                    onPressed: () => _decrementQuantity(product),
                  ),
                  Text(
                    "${product['quantity']}",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline, color: Colors.blue),
                    onPressed: () => _incrementQuantity(product),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTotalSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 2,
          spreadRadius: 1,
          offset: Offset(0, -1),
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("\$${_total.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentScreen(cartItems: [], totalAmount: _total),
                  ),
                );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: Text("Payment", style: TextStyle(color: Colors.white,fontSize: 18)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _cartItems,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  final items = snapshot.data!;
                  if (items.isEmpty) {
                    return Center(child: Text("Your cart is empty."));
                  }
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return _buildCartItem(items[index]);
                    },
                  );
                }
                return Center(child: Text("No items in cart."));
              },
            ),
          ),
          _buildTotalSection(),
        ],
      ),
    );
  }
}
