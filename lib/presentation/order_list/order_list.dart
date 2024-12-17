import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  List<dynamic> _orders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  // Hàm lấy danh sách đơn hàng
  Future<void> _fetchOrders() async {
    final url = Uri.parse(
        'https://included-sheepdog-slowly.ngrok-free.app/api/orders/by-user/');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token == null) {
      print("No token found. Please log in.");
      return;
    }

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          _orders = jsonData['results'];
          _isLoading = false;
        });
      } else {
        print("Failed to fetch orders: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching orders: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Widget hiển thị từng đơn hàng
// Widget hiển thị từng đơn hàng
  Widget _buildOrderItem(Map<String, dynamic> order) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order #${order['order_number']}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Status: ${order['status']}",
                style: TextStyle(color: Colors.blue)),
            Text("Payment Method: ${order['payment_method']}",
                style: TextStyle(color: Colors.black54)),
            Text("Total Price: \$${order['total_price']}",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Divider(),
            Text("Items:", style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              children: (order['items'] as List<dynamic>).map((item) {
                return ListTile(
                  leading: Image.network(
                    item['product_image'], // Hiển thị ảnh sản phẩm
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image_not_supported,
                          size: 50, color: Colors.grey);
                    },
                  ),
                  title: Text(item['product_name'] ?? "Product Name"),
                  subtitle: Text(
                      "Size: ${item['size'] ?? '-'}, Color: ${item['color'] ?? '-'}, Qty: ${item['quantity'] ?? '1'}"),
                  trailing: Text(
                    "\$${item['total_price'] ?? '0.00'}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _orders.isEmpty
              ? Center(child: Text("No orders found."))
              : ListView.builder(
                  itemCount: _orders.length,
                  itemBuilder: (context, index) {
                    return _buildOrderItem(_orders[index]);
                  },
                ),
    );
  }
}
