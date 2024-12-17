import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '/models/product_model.dart'; 

class OneItemWidget extends StatelessWidget {
  final ProductModel product; 
  final VoidCallback onTap; 

  const OneItemWidget({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      height: 60.h,
      width: 60.h,
      padding: EdgeInsets.all(4.h),
      decoration: IconButtonStyleHelper.none,
      onTap: onTap, 
      child: Image.network(
        product.mainImage ?? 'assets/images/placeholder.png', 
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/images/placeholder.png',
            fit: BoxFit.cover,
            width: double.infinity,
          );
        },
      ),
    );
  }
}
