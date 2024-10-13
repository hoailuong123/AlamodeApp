import 'package:flutter/material.dart'; 
const num FIGMA_DESIGN_WIDTH = 375;
const num FIGMA_DESIGN_HEIGHT = 812;
const num FIGMA_DESIGN_STATUS_BAR = 0;
extension ResponsiveExtension on num {
  double get width => SizeUtils.width;
  double get h => (this * width) / FIGMA_DESIGN_WIDTH;
  double get fSize => (this * width) / FIGMA_DESIGN_WIDTH;
}
extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }
  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}
enum DeviceType { mobile, tablet, desktop }
typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);
class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);
  /// Builds the widget whenever the orientation changes.
  final ResponsiveBuild builder;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
            return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}
// ignore_for_file: must_be_immutable
class SizeUtils {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;
  /// Device's Orientation
  static late Orientation orientation;
  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;
  /// Device's Height
  static late double height;
  /// Device's Width
  static late double width;
  static void setScreenSize(
      BoxConstraints constraints,
      Orientation currentOrientation,
      {
 num? designWidth = FIGMA_DESIGN_WIDTH,
        num? designHeight = FIGMA_DESIGN_HEIGHT,
      }) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    height = constraints.maxHeight;
    width = constraints.maxWidth;
    if (width > 600) {
      deviceType = DeviceType.desktop;
    } else if (width > 400) {
      deviceType = DeviceType.tablet;
    } else {
      deviceType = DeviceType.mobile;
    }
  }
}