import 'package:flutter/material.dart';
import 'package:alamodeapp/services/category_service.dart';
import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
 // Import your CustomBottomBar file

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  BottomBarEnum _selectedTab = BottomBarEnum.profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: _buildProfileContent(),
      bottomNavigationBar: CustomBottomBar(
        onChanged: (tab) {
          setState(() {
            _selectedTab = tab;
          });
          // Handle tab changes
          if (tab == BottomBarEnum.home) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (tab == BottomBarEnum.cart) {
            Navigator.pushReplacementNamed(context, '/cart');
          } else if (tab == BottomBarEnum.order) {
            Navigator.pushReplacementNamed(context, '/order');
          } else if (tab == BottomBarEnum.profile) {
            // Already on the profile screen
          }
        },
      ),
    );
  }

  Widget _buildProfileContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/profile_pic.png'), // Replace with actual user image
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Amanda!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "My Activity",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 24),
          Text(
            "Recently Viewed",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/product_$index.png'), // Replace with actual images
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 24),
          Text(
            "My Orders",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildOrderStatus("To Pay"),
              _buildOrderStatus("To Receive"),
              _buildOrderStatus("To Review"),
            ],
          ),
          SizedBox(height: 24),
          ListTile(
            title: Text("Order History"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to order history screen
            },
          ),
          ListTile(
            title: Text("Shipping Address"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to shipping address screen
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStatus(String status) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue[100],
          child: Text(
            status[0],
            style: TextStyle(color: Colors.blue),
          ),
        ),
        SizedBox(height: 8),
        Text(status),
      ],
    );
  }
}
