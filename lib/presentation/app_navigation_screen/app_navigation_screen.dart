import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, // Use named constructor for clarity
        body: SizedBox(
          width: double.infinity, // Use double.infinity for full width
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Use named constructor for clarity
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.h), // Assuming h is an extension for screen height
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h), // Assuming h is an extension for horizontal padding
                      child: Text(
                        "App Navigation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black, // Use named constructor for clarity
                          fontSize: 20.fSize, // Assuming fSize is an extension for font size
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}