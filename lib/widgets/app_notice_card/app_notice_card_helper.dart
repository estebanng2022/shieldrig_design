import 'package:flutter/material.dart';
import 'app_notice_card.dart';

/// Helper for creating common notice card patterns
class AppNoticeCardHelper {
  /// Create an info notice card
  static AppNoticeCard createInfoNotice({
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    bool showClose = false,
    VoidCallback? onClose,
  }) {
    return AppNoticeCard(
      title: title,
      subtitle: subtitle,
      variant: AppNoticeVariant.info,
      onTap: onTap,
      showClose: showClose,
      onClose: onClose,
    );
  }

  /// Create a success notice card
  static AppNoticeCard createSuccessNotice({
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    bool showClose = false,
    VoidCallback? onClose,
  }) {
    return AppNoticeCard(
      title: title,
      subtitle: subtitle,
      variant: AppNoticeVariant.success,
      onTap: onTap,
      showClose: showClose,
      onClose: onClose,
    );
  }

  /// Create a warning notice card
  static AppNoticeCard createWarningNotice({
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    bool showClose = false,
    VoidCallback? onClose,
  }) {
    return AppNoticeCard(
      title: title,
      subtitle: subtitle,
      variant: AppNoticeVariant.warning,
      onTap: onTap,
      showClose: showClose,
      onClose: onClose,
    );
  }

  /// Create an error notice card
  static AppNoticeCard createErrorNotice({
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    bool showClose = false,
    VoidCallback? onClose,
  }) {
    return AppNoticeCard(
      title: title,
      subtitle: subtitle,
      variant: AppNoticeVariant.error,
      onTap: onTap,
      showClose: showClose,
      onClose: onClose,
    );
  }

  /// Create a neutral notice card
  static AppNoticeCard createNeutralNotice({
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    bool showClose = false,
    VoidCallback? onClose,
  }) {
    return AppNoticeCard(
      title: title,
      subtitle: subtitle,
      variant: AppNoticeVariant.neutral,
      onTap: onTap,
      showClose: showClose,
      onClose: onClose,
    );
  }

  /// Create a dismissible notice card
  static AppNoticeCard createDismissibleNotice({
    required String title,
    String? subtitle,
    AppNoticeVariant variant = AppNoticeVariant.info,
    VoidCallback? onTap,
    required VoidCallback onClose,
  }) {
    return AppNoticeCard(
      title: title,
      subtitle: subtitle,
      variant: variant,
      onTap: onTap,
      showClose: true,
      onClose: onClose,
    );
  }
} 