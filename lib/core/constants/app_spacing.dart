import 'package:flutter/cupertino.dart';

class AppSpacing {
  // ===== From your design tokens =====
  static const double xs = 4.0;      // Extra Small
  static const double sm = 8.0;      // Small
  static const double md = 16.0;     // Medium (Margin Mobile)
  static const double lg = 24.0;     // Large
  static const double xl = 32.0;     // Extra Large

  // ===== Specific values from your design =====
  static const double marginMobile = 16.0;
  static const double gutterMobile = 12.0;
  static const double cardPadding = 16.0;
  static const double chipPadding = 8.0;

  // ===== Component Sizing =====
  static const double appBarHeight = 64.0;
  static const double bottomNavHeight = 64.0;
  static const double searchBarHeight = 48.0;
  static const double categoryChipHeight = 32.0;
  static const double fabSize = 56.0;

  // ===== Border Radius =====
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusXLarge = 16.0;
  static const double radiusFull = 9999.0;

  // ===== Icon Sizes =====
  static const double iconSmall = 16.0;
  static const double iconMedium = 20.0;
  static const double iconLarge = 24.0;
  static const double iconXLarge = 32.0;

  // ===== Image Aspect Ratios =====
  static const double productImageAspectRatio = 4 / 5; // 0.8
  static const double squareAspectRatio = 1.0;
  static const double wideAspectRatio = 16 / 9;

  // ===== Grid/List Spacing =====
  static const double gridSpacing = 12.0;
  static const double listItemSpacing = 16.0;

  // ===== Padding Shortcuts =====
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 0,
  );

  static const EdgeInsets cardPaddingAll = EdgeInsets.all(16.0);
  static const EdgeInsets cardPaddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets cardPaddingVertical = EdgeInsets.symmetric(vertical: 8.0);

  static const EdgeInsets chipPaddingAll = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 8.0,
  );

  static const EdgeInsets searchPadding = EdgeInsets.only(
    left: 48.0,
    right: 16.0,
  );
}