import 'package:flutter/material.dart';
import '/services/product_service.dart';
import '/models/product_model.dart';
import '/presentation/product_screen/product_screen.dart';

class GridSaleItemWidget extends StatelessWidget {
  final ProductModel product;

  const GridSaleItemWidget({Key? key, required this.product}) : super(key: key);

  String calculateDiscount(String originalPrice, String salePrice) {
    double original = double.parse(originalPrice);
    double sale = double.parse(salePrice);
    double discount = ((original - sale) / original) * 100;
    return discount.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Product Detail with productId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(productid: product.id),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                product.mainImage ?? 'assets/images/placeholder.png',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),

            // Product Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            SizedBox(height: 4),

            // Product Price and Discount
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.salePrice}",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "-${calculateDiscount(product.price, product.salePrice!)}%",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),

            // Original Price (strikethrough)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "\$${product.price}",
                style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
