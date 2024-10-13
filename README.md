# alamodeapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# AlamodeApp
# SDK Versions
    Dart SDK Version 3.3.2 or greater.
    Flutter SDK Version 3.19.4 or greater.
# Libraries
    1.fluttertoast - Toast Library for Flutter https://pub.dev/packages/fluttertoast
# Check the UI of the entire app
    Check the UI of all the app screens from a single place by setting up the 'initialRoute' to AppNavigation in the AppRoutes.dart file

# Application structure

.
├── android                    - It contains files required to run the application on an Android platform.
├── assets                     - It contains all images and fonts of your application.
├── ios                        - It contains files required to run the application on an iOS platform.
├── lib                        - Most important folder in the application, used to write most of the Dart code.
  ├── main.dart              - Starting point of the application
  ├── core
  │   ├── app_export.dart    - It contains commonly used file imports
  │   ├── constants          - It contains static constant class file
  │   └── utils              - It contains common files and utilities of the application
  ├── presentation           - It contains widgets of the screens
  ├── routes                 - It contains all the routes of the application
  └── theme                  - It contains app theme and decoration classes
  └── widgets                - It contains all custom widget classes
  
# Running the App
    1. Fetch necessary dependencies using flutter pub get.
    2. Start the application with flutter run.

