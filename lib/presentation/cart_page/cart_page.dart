import 'package:flutter/material.dart';
import 'package:alamodeapp/theme/custom_text_style.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../core/app_export.dart';
import 'widgets/list_product_item.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cart",
                style: CustomTextStyles.titleLargeBlack900,
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ProductListItemWidget(),
                  SizedBox(height: 16),
                  ProductListItemWidget(),
                  SizedBox(height: 32),
                ],
              ),
            ),
            _buildTotalAndCheckout(context),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  Widget _buildTotalAndCheckout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: CustomTextStyles.titleMediumBlack900,
          ),
          Row(
            children: [
              Text(
                "\$34,00",
                style: CustomTextStyles.headlineMediumBlack900,
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  "Checkout",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Wishlist",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "Orders",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
