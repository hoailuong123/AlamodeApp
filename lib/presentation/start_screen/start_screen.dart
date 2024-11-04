import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child:  CustomImageView(
                            imagePath: ImageConstant.iconBag,
                            height: 92.h,
                            width: 82.h,
                          )
                  ),
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Shoppe",
                    style: theme.textTheme.displayLarge,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Beautiful eCommerce UI Kit\nfor your online store",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                    color: const Color.fromARGB(255, 17, 17, 17),
                  ),
                ),
                SizedBox(height: 68.h),
                CustomElevatedButton(
                  height: 61.h,
                  text: "Let's get started",
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  buttonTextStyle: CustomTextStyles.titleLargeNunitoSansGray10001,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.createAccountScreen);
                  },
                ),
                SizedBox(height: 14.h),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    TextButton(
                      onPressed: () {
                         Navigator.pushNamed(context, AppRoutes.loginScreen);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min, 
                        children: [
                          Text(
                            "I already have an account",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Color(0xFF9EB4EB),
                            ),
                          ),
                          SizedBox(width: 8), 
                          CustomImageView(
                            imagePath: ImageConstant.iconBtnLeft,
                            height: 32,
                            width: 32,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}