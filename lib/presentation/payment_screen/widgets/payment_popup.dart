import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../to_receive_progress_screen/to_receive_progress_screen.dart';

class PaymentPopup {
  static Future<void> show(BuildContext context) async {
    BuildContext? dialogContext;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext progressContext) {
        dialogContext = progressContext;
        return _buildProgressPopup();
      },
    );

    await Future.delayed(Duration(seconds: 2));

    if (dialogContext != null) {
      Navigator.of(dialogContext!).pop();
    }

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return _buildDonePopup(context);
      },
    );
  }

  static Widget _buildProgressPopup() {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Colors.blue,
            ),
            const SizedBox(height: 24),
            Text(
              "Payment is in progress",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Please, wait a few moments",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Build Payment Done Popup
  static Widget _buildDonePopup(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Checkmark Icon
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue,
              child: Icon(Icons.check, color: Colors.white, size: 36),
            ),
            const SizedBox(height: 24),
            // Success Message
            Text(
              "Done!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Your card has been successfully charged",
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Track My Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  
                  // Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReceiveProgressScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 98, 100, 101),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Track My Order",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
