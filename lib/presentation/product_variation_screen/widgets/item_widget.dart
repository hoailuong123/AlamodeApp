import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class ChipviewcolorItemWidget extends StatelessWidget {
  const ChipviewcolorItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 2.h,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Pink",
        style: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.indigo50,
      selectedColor: theme.colorScheme.primary,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          4.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
