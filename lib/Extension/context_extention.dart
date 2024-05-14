import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  bool get isSmallScreen => width < 700;
  bool get isLargeScreen => width > 1200;
  bool get isMediumScreen => width >= 700 && width <= 1200;
}
