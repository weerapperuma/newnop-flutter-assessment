import 'package:flutter/material.dart';

class AppDurations {
  // ===== Animation Durations =====
  static const Duration fastest = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration slower = Duration(milliseconds: 700);
  static const Duration slowest = Duration(milliseconds: 1000);

  // ===== Transitions =====
  static const Duration pageTransition = Duration(milliseconds: 300);
  static const Duration routeAnimation = Duration(milliseconds: 350);
  static const Duration fadeAnimation = Duration(milliseconds: 400);
  static const Duration scaleAnimation = Duration(milliseconds: 300);
  static const Duration slideAnimation = Duration(milliseconds: 400);

  // ===== UI Interactions =====
  static const Duration buttonPress = Duration(milliseconds: 150);
  static const Duration hoverEffect = Duration(milliseconds: 200);
  static const Duration rippleEffect = Duration(milliseconds: 300);
  static const Duration favouriteToggle = Duration(milliseconds: 250);

  // ===== Loading States =====
  static const Duration shimmerDuration = Duration(milliseconds: 1500);
  static const Duration skeletonDuration = Duration(milliseconds: 1200);
  static const Duration progressIndicator = Duration(milliseconds: 1000);

  // ===== Debounce =====
  static const Duration searchDebounce = Duration(milliseconds: 300);
  static const Duration filterDebounce = Duration(milliseconds: 500);
  static const Duration saveDebounce = Duration(milliseconds: 400);

  // ===== Delays =====
  static const Duration snackbarDuration = Duration(milliseconds: 3000);
  static const Duration toastDuration = Duration(milliseconds: 2000);
  static const Duration splashDuration = Duration(milliseconds: 1500);
  static const Duration autoCloseDuration = Duration(milliseconds: 5000);

  // ===== Scroll & Refresh =====
  static const Duration scrollAnimation = Duration(milliseconds: 300);
  static const Duration refreshIndicator = Duration(milliseconds: 400);
  static const Duration pullToRefresh = Duration(milliseconds: 500);
}