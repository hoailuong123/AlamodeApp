import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../custom_search_view.dart';

class AppbarTitleSearchviewOne extends StatelessWidget {
  AppbarTitleSearchviewOne({Key? key, this.hintText, this.controller, this.margin})
      : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: SizedBox(
        width: double.maxFinite,
        child: CustomSearchView(
          controller: controller,
          contentPadding: EdgeInsets.fromLTRB(54.h, 6.h, 16.h, 6.h),
          borderDecoration: SearchViewStyleHelper.outlineGray,
          fillColor: theme.colorScheme.onErrorContainer,
        ),
      ),
    );
  }
}
