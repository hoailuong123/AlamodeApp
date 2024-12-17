import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../product_screen/product_screen.dart';

class GridNewItemWidget extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;
  final int productId; // Add productId for navigation

  const GridNewItemWidget({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductScreen with productId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(productid: productId),
          ),
        );
      },
      child: SizedBox(
        width: 140.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(4.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.onErrorContainer,
                borderRadius: BorderRadiusStyle.roundedBorder10,
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black900.withOpacity(0.1),
                    spreadRadius: 2.h,
                    blurRadius: 2.h,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusStyle.roundedBorder5,
                child: Image.network(
                  imageUrl,
                  height: 128.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              productName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(height: 1.33),
            ),
            SizedBox(height: 4.h),
            Text(
              "\$$productPrice",
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
