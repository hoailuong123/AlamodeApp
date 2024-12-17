import 'package:alamodeapp/presentation/payment_screen/widgets/payment_popup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'widgets/shipping_address_popup.dart';
import 'widgets/contact_information_popup.dart';
import 'widgets/payment_method_popup.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../theme/custom_text_style.dart';
import '../../../core/app_export.dart';
import 'widgets/list_product.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.cartItems,
    required this.totalAmount,}) : super(key: key);
  final List<dynamic> cartItems; // Danh sách sản phẩm
  final double totalAmount; // Tổng tiền

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Shipping Address
  String _country = "Vietnam";
  String _city = "Da Nang";
  String _address = "Ori Garden LakeSide";

  // Shipping Options
  String _selectedShippingOption = "Standard";

  // Contact Information
  String _phone = "+84932000000";
  String _email = "amandamorgan@example.com";

  // Payment Method
  String _selectedPaymentMethod = "MasterCard ****1579";

  // Product List
  List<dynamic> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  Future<void> _fetchCartItems() async {
    final url = Uri.parse(
        'https://included-sheepdog-slowly.ngrok-free.app/api/cart/detail/');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token == null) return;

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
          _cartItems = jsonData['items'];
        });
      }
    } catch (e) {
      print("Error fetching cart items: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment", style: CustomTextStyles.titleMediumBlack900),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Shipping Address"),
              _buildCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$_address, $_city\n"
                      "$_country",
                      style: theme.textTheme.bodyMedium,
                    ),
                    _buildAddressEditIcon(context),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionTitle("Contact Information"),
              _buildCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_phone, style: theme.textTheme.bodyMedium),
                        Text(_email, style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        final result = await ContactInformationPopup.show(
                          context: context,
                          initialPhone: _phone,
                          initialEmail: _email,
                        );
                        if (result != null) {
                          setState(() {
                            _phone = result['Phone'] ?? _phone;
                            _email = result['Email'] ?? _email;
                          });
                        }
                      },
                      child: _buildEditIcon(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionTitle("Items"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBadge("${_cartItems.length}"),
                  TextButton(onPressed: () {}, child: Text("Add Voucher")),
                ],
              ),
              const SizedBox(height: 8),
              // Hiển thị danh sách sản phẩm
              ..._cartItems
                  .map((product) => ListProductItemWidget(product: product)),
              const SizedBox(height: 16),
              _buildSectionTitle("Shipping Options"),
              _buildShippingOptions(),
              const SizedBox(height: 16),
              _buildSectionTitle("Payment Method"),
              _buildCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedPaymentMethod,
                      style: CustomTextStyles.titleMediumBlack900,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final result = await PaymentMethodPopup.show(
                          context: context,
                          currentSelectedMethod: _selectedPaymentMethod,
                        );
                        if (result != null) {
                          setState(() {
                            _selectedPaymentMethod = result;
                          });
                        }
                      },
                      child: _buildEditIcon(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildTotalSection(),
              const SizedBox(height: 16),
              _buildPayButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: CustomTextStyles.titleMediumBlack900);
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 4,
          )
        ],
      ),
      child: child,
    );
  }

  Widget _buildBadge(String count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        count,
        style: CustomTextStyles.titleMediumBlack900,
      ),
    );
  }

  Widget _buildTotalSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total", style: CustomTextStyles.titleMediumBlack900),
        Text("\$34,00", style: CustomTextStyles.titleMediumBlack900),
      ],
    );
  }

  Widget _buildPayButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
        onPressed: () {
          PaymentPopup.show(context);
          print("Selected Payment Method: $_selectedPaymentMethod");
        },
        buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 12)),
        height: 50.h,
        text: "Payment",
      ),
    );
  }

  Widget _buildAddressEditIcon(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await ShippingAddressPopup.show(context);
        if (result != null) {
          setState(() {
            _country = result['Country'] ?? _country;
            _city = result['Town/City'] ?? _city;
            _address = result['Address'] ?? _address;
          });
        }
      },
      child: _buildEditIcon(),
    );
  }

  Widget _buildEditIcon() {
    return CircleAvatar(
      radius: 14,
      backgroundColor: appTheme.indigo50,
      child: Icon(Icons.edit, color: Colors.blue, size: 18),
    );
  }

  Widget _buildShippingOptions() {
    return Column(
      children: [
        _buildShippingOption("Standard", "5-7 days", "FREE",
            _selectedShippingOption == "Standard"),
        const SizedBox(height: 8),
        _buildShippingOption("Express", "1-2 days", "\$12,00",
            _selectedShippingOption == "Express"),
      ],
    );
  }

  Widget _buildShippingOption(
      String title, String duration, String price, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedShippingOption = title;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? appTheme.indigo50 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Radio<String>(
                  value: title,
                  groupValue: _selectedShippingOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedShippingOption = value!;
                    });
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: CustomTextStyles.titleMediumBlack900),
                    Text(duration, style: theme.textTheme.bodySmall),
                  ],
                ),
              ],
            ),
            Text(price, style: CustomTextStyles.titleMediumBlack900),
          ],
        ),
      ),
    );
  }
}
