import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class ListaecaItemWidget extends StatelessWidget {
  const ListaecaItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74.h,
      child: CustomImageView(
        imagePath: ImageConstant.imgProduct6,
        height: 74.h,
        width: 74.h,
        radius: BorderRadius.circular(
          5.h,
        ),
      ),
    );
  }
}
