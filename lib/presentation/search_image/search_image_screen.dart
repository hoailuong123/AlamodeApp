import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchImageScreen extends StatefulWidget {
  const SearchImageScreen({Key? key}) : super(key: key);

  @override
  State<SearchImageScreen> createState() => _SearchImageScreenState();
}

class _SearchImageScreenState extends State<SearchImageScreen> {
  File? _imageFile; // Ảnh người dùng chọn
  List<dynamic> _products = []; // Danh sách sản phẩm trả về từ API
  bool _isLoading = false;

  final ImagePicker _picker = ImagePicker();

  // Chọn ảnh từ thiết bị
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _uploadImage();
    }
  }

  // Gửi ảnh qua API và xử lý dữ liệu trả về
  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    setState(() {
      _isLoading = true;
      _products = [];
    });

    try {
      final uri = Uri.parse("http://10.10.11.232:1234/api/search/image-search/");
      final request = http.MultipartRequest('POST', uri);

      // Gửi file ảnh
      request.files.add(await http.MultipartFile.fromPath('image', _imageFile!.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonData = jsonDecode(responseData);

        setState(() {
          _products = jsonData['products'] ?? [];
        });
      } else {
        print("Failed to upload image: ${response.statusCode}");
        _showSnackBar("Image upload failed. Please try again.");
      }
    } catch (e) {
      print("Error uploading image: $e");
      _showSnackBar("An error occurred. Please try again.");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Hiển thị thông báo
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  // Widget hiển thị sản phẩm
  Widget _buildProductCard(Map<String, dynamic> product) {
    final imageUrl = product['images'] != null && product['images'].isNotEmpty
        ? product['images'][0]['image']
        : "https://via.placeholder.com/150"; // Ảnh mặc định nếu không có ảnh

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh sản phẩm
          Image.network(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Center(child: Icon(Icons.broken_image, size: 50)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'] ?? "Product Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Price: \$${product['price'] ?? '0.00'}",
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
                SizedBox(height: 4),
                Text(
                  "Brand: ${product['brand'] ?? 'N/A'}",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Image"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Nút chọn ảnh
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: _pickImage,
              icon: Icon(Icons.upload),
              label: Text("Upload Image", style: TextStyle(fontSize: 26, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
          ),
          if (_isLoading) ...[
            Center(child: CircularProgressIndicator()),
          ] else if (_products.isEmpty && _imageFile == null) ...[
            Center(child: Text("Please upload an image to search for products.")),
          ] else if (_products.isEmpty) ...[
            Center(child: Text("No products found.")),
          ] else ...[
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(_products[index]);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
