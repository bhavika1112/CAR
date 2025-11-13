  // responsive_helper.dart
  import 'package:flutter/material.dart';

  class ResponsiveHelper {
    static bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width < 600;

    static bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;

    static bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 1200;

    static double getResponsiveValue(BuildContext context,
        {double mobile = 1.0, double tablet = 1.0, double desktop = 1.0}) {
      final width = MediaQuery.of(context).size.width;
      if (width < 600) return mobile;
      if (width < 1200) return tablet;
      return desktop;
    }

    static double responsiveFontSize(BuildContext context,
        {double mobile = 14, double tablet = 16, double desktop = 18}) {
      final width = MediaQuery.of(context).size.width;
      final baseSize = isMobile(context) ? mobile : isTablet(context) ? tablet : desktop;
      
      // Scale based on screen width
      final scaleFactor = width / 375; // 375 is typical mobile width
      return baseSize * scaleFactor.clamp(0.8, 1.5);
    }

    static EdgeInsets responsivePadding(BuildContext context) {
      final width = MediaQuery.of(context).size.width;
      if (width < 600) {
        return const EdgeInsets.all(12);
      } else if (width < 1200) {
        return const EdgeInsets.all(20);
      } else {
        return const EdgeInsets.all(32);
      }
    }
  }