import 'package:flutter/material.dart';
import '../../../theme/custom_text_style.dart';
import '../../../core/app_export.dart';

class ListProductItemWidget extends StatelessWidget {
  final Map<String, dynamic> product;

  const ListProductItemWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Ảnh sản phẩm
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(
                'https://included-sheepdog-slowly.ngrok-free.app/${product['image']}',
              ),
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
                product['product_name'] ?? "Product Name",
                style: CustomTextStyles.titleMediumBlack900,
              ),
              Text(
                "Size: ${product['size']}, Color: ${product['color']}",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$${((product['price'] ?? 0) * (product['quantity'] ?? 1)).toStringAsFixed(2)}",
              style: CustomTextStyles.titleMediumBlack900,
            ),
            Text(
              "x${product['quantity'] ?? 1}", // Số lượng mặc định là 1 nếu null
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
