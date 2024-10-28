import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:country_pickers/country.dart';
import '../../widgets/custom_phone_number.dart';

// ignore: must_be_immutable
class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Country selectedCountry = CountryPickerUtils.getCountryByIsoCode('VN'); // Default country
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                ImageConstant.imageBgCreateAccount,
              ),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: SizedBox(
            height: SizeUtils.height,
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    _buildCreateAccountFormSection(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAccountFormSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Create \nAccount",
              style: theme.textTheme.displayLarge,
            ),
          ),
          SizedBox(height: 54.h),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomImageView(
              imagePath: ImageConstant.imgCamera,
              height: 90.h,
              width: 90.h,
            ),
          ),
          SizedBox(height: 30.h),
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
          SizedBox(height: 10.h),
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
          SizedBox(height: 10.h),
          CustomPhoneNumber(
            controller: phoneController,
            country: selectedCountry,
            onTap: (Country country) {
              setState(() {
                selectedCountry = country;
              });
            },
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 30.h),
          CustomElevatedButton(
            height: 58.h,
            text: "Done",
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: CustomTextStyles.titleLargeNunitoSansGray10001,
          ),
          SizedBox(height: 14.h),
          CustomElevatedButton(
            text: "Cancel",
            height: 55.h,
            buttonStyle: CustomButtonStyles.fillGray,
            buttonTextStyle: CustomTextStyles.titleMediumIndigo200,
            onPressed: () => {
               Navigator.pushNamed(context, AppRoutes.startScreen)
            },
          ),
        ],
      ),
    );
  }
}
