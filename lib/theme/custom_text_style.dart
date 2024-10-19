import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get raleway {
    return copyWith(
      fontFamily: 'Raleway',
    );
  }

  TextStyle get nunitoSans {
    return copyWith(
      fontFamily: 'Nunito Sans',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}

class CustomTextStyles {
  static TextStyle get titleLarge20 =>
      theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
      );
  static TextStyle get titleMediumIndigo200 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.indigo200,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumBlue800 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue800,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumBlack900Medium16 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumGray400 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray400,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMedium_1 => theme.textTheme.titleMedium!;
  static TextStyle get titleSmallPoppinsBluegray100 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray100,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleLargeNunitoSansGray10001 =>
      theme.textTheme.titleLarge!.copyWith(
          color: appTheme.gray10001,
          fontSize: 22.fSize,
          fontWeight: FontWeight.w300);
  static TextStyle get titleSmall15 => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
      );
  static TextStyle get titleMediumOnErrorContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );

  // text style
  static TextStyle get Gray5001 => TextStyle(
        color: appTheme.gray5001,
      );

  // Body text style
  static TextStyle get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 19.fSize,
      );

  static TextStyle get bodyLargeGray900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray900,
        fontSize: 19.fSize,
      );

  static TextStyle get bodyLargeOnPrimary =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bodyLargeRalewayBlack900 =>
      theme.textTheme.bodyLarge!.raleway.copyWith(
        color: appTheme.black900,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bodyMediumBlueA70001 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueA70001,
        fontSize: 13.fSize,
      );

  static TextStyle get bodyMediumGray900 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900.withOpacity(0.9),
        fontWeight: FontWeight.w300,
      );

  static TextStyle get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 10.fSize,
      );

  static TextStyle get bodySmallIndigo100 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.indigo100,
      );
  // Headline text style
  static TextStyle get headlineMediumBlack900 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get headlineMediumBlack900ExtraBold =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 26.fSize,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get headlineMediumOnErrorContainer =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 29.fSize,
      );

// Label text style
  static TextStyle get labelLargeBlack900 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );

  static TextStyle get labelLargeBlack900Bold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelLargeBlue20001 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blue20001,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelLargeBold_1 => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelLargeNunitoSansBlack900SemiBold => theme.textTheme.labelLarge!.nunitoSans.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      ); 
  static TextStyle get labelLargeNunitoSans =>
      theme.textTheme.labelLarge!.nunitoSans.copyWith(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeNunitoSansBlack900 =>
      theme.textTheme.labelLarge!.nunitoSans.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeNunitoSansBlack90 =>
      theme.textTheme.labelLarge!.nunitoSans.copyWith(
        color: appTheme.black900.withOpacity(0.9),
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeNunitoSansBlue20001 =>
      theme.textTheme.labelLarge!.nunitoSans.copyWith(
        color: appTheme.blue20001,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeNunitoSansGray900 =>
      theme.textTheme.labelLarge!.nunitoSans.copyWith(
        color: appTheme.gray900,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeNunitoSansGray90 =>
      theme.textTheme.labelLarge!.nunitoSans.copyWith(
        color: appTheme.gray900.withOpacity(0.9),
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeNunitoSansWhite =>
      theme.textTheme.labelLarge!.nunitoSans.copyWith(
        color: appTheme.white,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeRalewayBlack900 =>
      theme.textTheme.labelLarge!.raleway.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeRalewayBlack90 =>
      theme.textTheme.labelLarge!.raleway.copyWith(
        color: appTheme.black900.withOpacity(0.9),
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeRalewayBlue20001 =>
      theme.textTheme.labelLarge!.raleway.copyWith(
        color: appTheme.blue20001,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeRalewayGray900 =>
      theme.textTheme.labelLarge!.raleway.copyWith(
        color: appTheme.gray900,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeRalewayGray90 =>
      theme.textTheme.labelLarge!.raleway.copyWith(
        color: appTheme.gray900.withOpacity(0.9),
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeRalewayWhite =>
      theme.textTheme.labelLarge!.raleway.copyWith(
        color: appTheme.white,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumBlack900 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
      );

  static TextStyle get labelMediumBlack900Bold =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelMediumBlue20001 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blue20001,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get labelMediumBold => theme.textTheme.labelMedium!.copyWith(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelMediumBold_1 =>
      theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelMediumNunitoSans =>
      theme.textTheme.labelMedium!.nunitoSans.copyWith(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumNunitoSansBlack900 =>
      theme.textTheme.labelMedium!.nunitoSans.copyWith(
        color: appTheme.black900,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumNunitoSansBlack90 =>
      theme.textTheme.labelMedium!.nunitoSans.copyWith(
        color: appTheme.black900.withOpacity(0.9),
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumNunitoSansBlue20001 =>
      theme.textTheme.labelMedium!.nunitoSans.copyWith(
        color: appTheme.blue20001,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumNunitoSansGray900 =>
      theme.textTheme.labelMedium!.nunitoSans.copyWith(
        color: appTheme.gray900,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumNunitoSansGray90 =>
      theme.textTheme.labelMedium!.nunitoSans.copyWith(
        color: appTheme.gray900.withOpacity(0.9),
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumNunitoSansWhite =>
      theme.textTheme.labelMedium!.nunitoSans.copyWith(
        color: appTheme.white,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumRalewayBlack900 =>
      theme.textTheme.labelMedium!.raleway.copyWith(
        color: appTheme.black900,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumRalewayBlack90 =>
      theme.textTheme.labelMedium!.raleway.copyWith(
        color: appTheme.black900.withOpacity(0.9),
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumRalewayBlue20001 =>
      theme.textTheme.labelMedium!.raleway.copyWith(
        color: appTheme.blue20001,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumRalewayGray900 =>
      theme.textTheme.labelMedium!.raleway.copyWith(
        color: appTheme.gray900,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumRalewayGray90 =>
      theme.textTheme.labelMedium!.raleway.copyWith(
        color: appTheme.gray900.withOpacity(0.9),
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumRalewayWhite =>
      theme.textTheme.labelMedium!.raleway.copyWith(
        color: appTheme.white,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallBlack900 =>
      theme.textTheme.labelSmall!.copyWith(
        color: appTheme.black900,
      );

  static TextStyle get labelSmallBlack900Bold =>
      theme.textTheme.labelSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelSmallBlue20001 =>
      theme.textTheme.labelSmall!.copyWith(
        color: appTheme.blue20001,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get labelSmallBold => theme.textTheme.labelSmall!.copyWith(
        fontSize: 9.fSize,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelSmallBold_1 => theme.textTheme.labelSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );

  static TextStyle get labelSmallNunitoSans =>
      theme.textTheme.labelSmall!.nunitoSans.copyWith(
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallNunitoSansBlack900 =>
      theme.textTheme.labelSmall!.nunitoSans.copyWith(
        color: appTheme.black900,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallNunitoSansBlack90 =>
      theme.textTheme.labelSmall!.nunitoSans.copyWith(
        color: appTheme.black900.withOpacity(0.9),
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallNunitoSansBlue20001 =>
      theme.textTheme.labelSmall!.nunitoSans.copyWith(
        color: appTheme.blue20001,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallNunitoSansGray900 =>
      theme.textTheme.labelSmall!.nunitoSans.copyWith(
        color: appTheme.gray900,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallNunitoSansGray90 =>
      theme.textTheme.labelSmall!.nunitoSans.copyWith(
        color: appTheme.gray900.withOpacity(0.9),
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallNunitoSansWhite =>
      theme.textTheme.labelSmall!.nunitoSans.copyWith(
        color: appTheme.white,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallRalewayBlack900 =>
      theme.textTheme.labelSmall!.raleway.copyWith(
        color: appTheme.black900,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallRalewayBlack90 =>
      theme.textTheme.labelSmall!.raleway.copyWith(
        color: appTheme.black900.withOpacity(0.9),
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallRalewayBlue20001 =>
      theme.textTheme.labelSmall!.raleway.copyWith(
        color: appTheme.blue20001,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallRalewayGray900 =>
      theme.textTheme.labelSmall!.raleway.copyWith(
        color: appTheme.gray900,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallRalewayGray90 =>
      theme.textTheme.labelSmall!.raleway.copyWith(
        color: appTheme.gray900.withOpacity(0.9),
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelSmallRalewayWhite =>
      theme.textTheme.labelSmall!.raleway.copyWith(
        color: appTheme.white,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w600,
      );
}
