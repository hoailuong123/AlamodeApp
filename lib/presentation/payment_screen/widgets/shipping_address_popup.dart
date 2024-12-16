import 'package:alamodeapp/core/app_export.dart';
import 'package:flutter/material.dart';

class ShippingAddressPopup {
  static Future<Map<String, String>?> show(BuildContext context) async {
    final TextEditingController _countryController =
        TextEditingController(text: "Vietnam");
    final TextEditingController _cityController =
        TextEditingController(text: "Da Nang");
    final TextEditingController _addressController =
        TextEditingController(text: "Ori Garden LakeSide");

    return await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  "Shipping Address",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                // Country Input
                _buildInputLabel("Country"),
                CustomTextFormField(
                  controller: _countryController,
                  textStyle: TextStyle(color: appTheme.black900),
                ),
                SizedBox(height: 12),
                // Town/City Input
                _buildInputLabel("Town / City"),
                CustomTextFormField(
                  controller: _cityController,
                  textStyle: TextStyle(color: appTheme.black900),
                ),
                SizedBox(height: 12),
                // Address Input
                _buildInputLabel("Address"),
                CustomTextFormField(
                  controller: _addressController,
                  textStyle: TextStyle(color: appTheme.black900),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        "Country": _countryController.text,
                        "Town/City": _cityController.text,
                        "Address": _addressController.text,
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Save Changes",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}
