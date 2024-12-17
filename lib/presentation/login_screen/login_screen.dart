import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _login(BuildContext context) async {
    final username = emailController.text.trim();
    final password = passwordController.text.trim();

    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse('https://sterling-notably-monster.ngrok-free.app/api/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'username': username, 'password': password}),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);

          // Lưu thông tin user vào local storage
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', responseData['access']);
          await prefs.setString('refresh_token', responseData['refresh']);
          await prefs.setString('username', responseData['username']);
          await prefs.setString('email', responseData['email']);
          await prefs.setString('role', responseData['role']);

          // Chuyển tới màn hình chính
          Navigator.pushNamed(context, AppRoutes.shopScreen);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed: Invalid credentials!')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onErrorContainer,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgLogin,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: SizedBox(
            height: SizeUtils.height,
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 68.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    _buildLoginFormSection(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginFormSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Login",
              style: theme.textTheme.displayLarge,
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Good to see you back!",
                    style: CustomTextStyles.bodyLargeGray900,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.iconHeart,
                  height: 14.h,
                  width: 14.h,
                  margin: EdgeInsets.only(
                    left: 10.h,
                    top: 2.h,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            controller: emailController,
            hintText: "Email",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.emailAddress,
            contentPadding: EdgeInsets.fromLTRB(18.h, 14.h, 18.h, 12.h),
            borderDecoration: TextFormFieldStyleHelper.fillGray,
            fillColor: appTheme.gray5001,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            controller: passwordController,
            hintText: "Password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            contentPadding: EdgeInsets.fromLTRB(18.h, 14.h, 18.h, 12.h),
            borderDecoration: TextFormFieldStyleHelper.fillGray,
            fillColor: appTheme.gray5001,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your password";
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          CustomElevatedButton(
            height: 60.h,
            text: "Next",
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: CustomTextStyles.titleLargeNunitoSansGray10001,
            onPressed: () => _login(context),
          ),
          SizedBox(height: 14.h),
          CustomElevatedButton(
            text: "Cancel",
            height: 60.h,
            buttonStyle: CustomButtonStyles.fillGray,
            buttonTextStyle: CustomTextStyles.titleMediumIndigo200,
            onPressed: () => {
              Navigator.pushNamed(context, AppRoutes.startScreen)
            },
          )
        ],
      ),
    );
  }
}
