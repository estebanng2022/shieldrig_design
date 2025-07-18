import 'package:flutter/material.dart';

/// Semantic duration constants for consistent animations throughout the app
class AppDurations {
  const AppDurations._();

  // Base durations
  static const Duration instant = Duration(milliseconds: 0);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 600);
  static const Duration verySlow = Duration(milliseconds: 1000);

  // Animation durations
  static const Duration fadeIn = Duration(milliseconds: 200);
  static const Duration fadeOut = Duration(milliseconds: 150);
  static const Duration slideIn = Duration(milliseconds: 250);
  static const Duration slideOut = Duration(milliseconds: 200);
  static const Duration scaleIn = Duration(milliseconds: 300);
  static const Duration scaleOut = Duration(milliseconds: 250);

  // Page transitions
  static const Duration pageTransition = Duration(milliseconds: 300);
  static const Duration pageTransitionFast = Duration(milliseconds: 200);
  static const Duration pageTransitionSlow = Duration(milliseconds: 500);

  // UI feedback durations
  static const Duration buttonFeedback = Duration(milliseconds: 100);
  static const Duration rippleEffect = Duration(milliseconds: 400);
  static const Duration hoverEffect = Duration(milliseconds: 150);
  static const Duration focusEffect = Duration(milliseconds: 200);

  // Snackbar and toast durations
  static const Duration snackbarShow = Duration(milliseconds: 300);
  static const Duration snackbarHide = Duration(milliseconds: 200);
  static const Duration snackbarDisplay = Duration(seconds: 4);
  static const Duration toastShow = Duration(milliseconds: 250);
  static const Duration toastHide = Duration(milliseconds: 150);

  // Loading and progress durations
  static const Duration loadingSpinner = Duration(milliseconds: 1000);
  static const Duration progressAnimation = Duration(milliseconds: 500);
  static const Duration skeletonLoading = Duration(milliseconds: 1500);

  // Form and input durations
  static const Duration formValidation = Duration(milliseconds: 200);
  static const Duration inputFocus = Duration(milliseconds: 150);
  static const Duration inputBlur = Duration(milliseconds: 100);

  // Card and container animations
  static const Duration cardHover = Duration(milliseconds: 200);
  static const Duration cardPress = Duration(milliseconds: 100);
  static const Duration containerExpand = Duration(milliseconds: 300);
  static const Duration containerCollapse = Duration(milliseconds: 250);

  // List and grid animations
  static const Duration listItemAppear = Duration(milliseconds: 300);
  static const Duration listItemDisappear = Duration(milliseconds: 200);
  static const Duration gridItemAppear = Duration(milliseconds: 250);
  static const Duration gridItemDisappear = Duration(milliseconds: 150);

  // Modal and dialog durations
  static const Duration modalShow = Duration(milliseconds: 300);
  static const Duration modalHide = Duration(milliseconds: 200);
  static const Duration dialogShow = Duration(milliseconds: 250);
  static const Duration dialogHide = Duration(milliseconds: 150);

  // Navigation durations
  static const Duration navigationPush = Duration(milliseconds: 300);
  static const Duration navigationPop = Duration(milliseconds: 250);
  static const Duration tabSwitch = Duration(milliseconds: 200);

  // Micro-interactions
  static const Duration microInteraction = Duration(milliseconds: 100);
  static const Duration microFeedback = Duration(milliseconds: 50);
  static const Duration microHover = Duration(milliseconds: 150);

  // Error and success animations
  static const Duration errorShake = Duration(milliseconds: 500);
  static const Duration successPulse = Duration(milliseconds: 300);
  static const Duration warningBlink = Duration(milliseconds: 400);

  // Responsive animations
  static const Duration responsiveTransition = Duration(milliseconds: 400);
  static const Duration layoutChange = Duration(milliseconds: 300);
  static const Duration orientationChange = Duration(milliseconds: 500);

  // Custom duration getters for common use cases
  static Duration get animationFast => fast;
  static Duration get animationNormal => normal;
  static Duration get animationSlow => slow;

  static Duration get transitionFast => pageTransitionFast;
  static Duration get transitionNormal => pageTransition;
  static Duration get transitionSlow => pageTransitionSlow;

  static Duration get feedbackFast => buttonFeedback;
  static Duration get feedbackNormal => rippleEffect;
  static Duration get feedbackSlow => hoverEffect;

  // Curved animation durations
  static const Curve fastCurve = Curves.easeInOut;
  static const Curve normalCurve = Curves.easeInOut;
  static const Curve slowCurve = Curves.easeInOut;

  // Common animation configurations
  static const AnimationConfig fastAnimation = AnimationConfig(
    duration: fast,
    curve: fastCurve,
  );

  static const AnimationConfig normalAnimation = AnimationConfig(
    duration: normal,
    curve: normalCurve,
  );

  static const AnimationConfig slowAnimation = AnimationConfig(
    duration: slow,
    curve: slowCurve,
  );
}

/// Configuration class for animations
class AnimationConfig {
  const AnimationConfig({
    required this.duration,
    required this.curve,
  });

  final Duration duration;
  final Curve curve;
} 