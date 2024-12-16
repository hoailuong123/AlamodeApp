import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_text_style.dart';

class PaymentMethodPopup {
  static Future<String?> show({
    required BuildContext context,
    required String currentSelectedMethod,
  }) async {
    String selectedMethod = currentSelectedMethod;

    return await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    "Payment Methods",
                    style: CustomTextStyles.titleMediumBlack900.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Card 1: MasterCard
                  _buildPaymentMethodCard(
                    context: context,
                    cardName: "HOAI LUONG LE THI",
                    cardEnding: "1579",
                    expiry: "12/22",
                    cardIcon: Icons.credit_card, // Replace with actual image if needed
                    isSelected: selectedMethod == "MASTER CARD",
                    onTap: () {
                      setState(() {
                        selectedMethod = "MASTER CARD";
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  // Card 2: Visa (Example)
                  _buildPaymentMethodCard(
                    context: context,
                    cardName: "HOAI LUONG LE THI",
                    cardEnding: "2031",
                    expiry: "06/25",
                    cardIcon: Icons.credit_card, 
                    isSelected: selectedMethod == "VISA",
                    onTap: () {
                      setState(() {
                        selectedMethod = "VISA";
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, selectedMethod);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildPaymentMethodCard({
    required BuildContext context,
    required String cardName,
    required String cardEnding,
    required String expiry,
    required IconData cardIcon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
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
                Icon(cardIcon, color: Colors.orange, size: 36),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "**** **** **** $cardEnding",
                      style: CustomTextStyles.titleMediumBlack900,
                    ),
                    Text(
                      cardName,
                      style: theme.textTheme.bodySmall,
                    ),
                    Text(
                      "Expiry: $expiry",
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: Colors.blue, size: 24),
          ],
        ),
      ),
    );
  }
}
