import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import '../core/app_export.dart';

class CustomPhoneNumber extends StatelessWidget {
  final Country country;
  final Function(Country) onTap;
  final TextEditingController? controller;

  CustomPhoneNumber({
    Key? key,
    required this.country,
    required this.onTap,
    required this.controller,
    required TextInputType keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      decoration: BoxDecoration(
        color: appTheme.gray5001,
        borderRadius: BorderRadius.circular(26.h),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _openCountryPicker(context);
            },
            child: Row(
              children: [
                SizedBox(
                  height: 16.h,
                  width: 22.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1.h),
                    child: CountryPickerUtils.getDefaultFlagImage(country),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgCheckMark,
                  height: 14.h,
                  width: 14.h,
                  margin: EdgeInsets.only(left: 6.h),
                ),
                Container(
                  height: 22.h,
                  width: 1.h,
                  margin: EdgeInsets.only(left: 14.h),
                  decoration: BoxDecoration(
                    color: appTheme.gray90003,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 216.h,
              margin: EdgeInsets.only(left: 14.h),
              child: TextFormField(
                focusNode: FocusNode(),
                autofocus: true,
                controller: controller,
                style: CustomTextStyles.titleSmallPoppinsBluegray100,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: "Your number",
                  hintStyle: CustomTextStyles.titleSmallPoppinsBluegray100,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.h,
                    vertical: 14.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Container(
            margin: EdgeInsets.only(
              left: 10.h,
            ),
            width: 60.h,
            child: Text(
              "+${country.phoneCode}",
              style: TextStyle(fontSize: 14.fSize),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              country.name,
              style: TextStyle(fontSize: 14.fSize),
            ),
          ),
        ],
      );

  void _openCountryPicker(BuildContext context) => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          searchInputDecoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(fontSize: 14.fSize),
          ),
          isSearchable: true,
          title: Text('Select your phone code',
              style: TextStyle(fontSize: 14.fSize)),
          onValuePicked: (Country country) => onTap(country),
          itemBuilder: _buildDialogItem,
        ),
      );
}
