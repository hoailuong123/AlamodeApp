import 'package:flutter/material.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../core/app_export.dart';

class ContactInformationPopup {
  static Future<Map<String, String>?> show({
    required BuildContext context,
    required String initialPhone,
    required String initialEmail,
  }) async {
    // Controllers for phone and email fields
    final TextEditingController _phoneController =
        TextEditingController(text: initialPhone);
    final TextEditingController _emailController =
        TextEditingController(text: initialEmail);

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
                  "Contact Information",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                // Phone Number Input
                _buildInputLabel("Phone Number"),
                CustomTextFormField(
                  controller: _phoneController,
                  textInputType: TextInputType.phone,
                  textStyle: TextStyle(color: appTheme.black900),
                  hintText: "Enter your phone number",
                ),
                SizedBox(height: 12),
                // Email Address Input
                _buildInputLabel("Email Address"),
                CustomTextFormField(
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  textStyle: TextStyle(color: appTheme.black900),
                  hintText: "Enter your email address",
                ),
                SizedBox(height: 16),
                // Save Changes Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Return the updated phone and email values
                      Navigator.pop(context, {
                        "Phone": _phoneController.text,
                        "Email": _emailController.text,
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
