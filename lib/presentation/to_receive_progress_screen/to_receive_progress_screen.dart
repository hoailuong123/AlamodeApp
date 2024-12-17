import 'package:alamodeapp/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../../theme/custom_text_style.dart';
import '/presentation/order_list/order_list.dart'; // Import màn hình Order List

class ReceiveProgressScreen extends StatelessWidget {
  const ReceiveProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "To Receive",
          style: CustomTextStyles.titleMediumBlack900.copyWith(fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile and Tracking Header
            _buildHeaderSection(),
            const SizedBox(height: 24),
            // Progress Bar
            _buildProgressBar(),
            const SizedBox(height: 16),
            // Tracking Number Section
            _buildTrackingNumber(),
            const SizedBox(height: 16),
            // Timeline
            _buildTimeline(),
            const SizedBox(height: 30),

            _buildBottomSection(context)
          ],
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeaderSection() {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(ImageConstant.imgProfile),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "To Receive",
              style: CustomTextStyles.titleMediumBlack900.copyWith(fontSize: 18),
            ),
            Text(
              "Track Your Order",
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.notifications_none, size: 24),
          onPressed: () {},
        ),
      ],
    );
  }

  // Progress Bar
  Widget _buildProgressBar() {
    return Stack(
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Positioned(
          left: 0,
          child: Container(
            height: 8,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  // Tracking Number
  Widget _buildTrackingNumber() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tracking Number",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                "LGS-i92927839300763731",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
          Icon(Icons.copy, color: Colors.blue),
        ],
      ),
    );
  }

  // Timeline
  Widget _buildTimeline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTimelineItem(
          title: "Packed",
          time: "April, 19 12:31",
          description:
              "Your parcel is packed and will be handed over to our delivery partner.",
          isCompleted: true,
        ),
        _buildTimelineItem(
          title: "On the Way to Logistic Facility",
          time: "April, 19 16:20",
          description:
              "Your parcel is on the way to our logistic facility.",
          isCompleted: true,
        ),
        _buildTimelineItem(
          title: "Arrived at Logistic Facility",
          time: "April, 19 19:07",
          description:
              "Your parcel has arrived at our logistic facility.",
          isCompleted: true,
        ),
        _buildTimelineItem(
          title: "Shipped",
          time: "Expected on April, 20",
          description: "Your parcel is on the way to its final destination.",
          isCompleted: false,
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String time,
    required String description,
    required bool isCompleted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 8,
              backgroundColor: isCompleted ? Colors.blue : Colors.grey.shade300,
            ),
            Container(
              width: 2,
              height: 60,
              color: isCompleted ? Colors.blue : Colors.grey.shade300,
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCompleted ? Colors.black : Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 4),
              Text(time, style: TextStyle(color: Colors.grey.shade600)),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: isCompleted
                      ? Colors.grey.shade800
                      : Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderListScreen()),
          );
        },
        child: Text("All My Order", style: TextStyle(color: Colors.white,fontSize: 20)),
      ),
     // Đường phân cách
    ],
  );
}

}


  
