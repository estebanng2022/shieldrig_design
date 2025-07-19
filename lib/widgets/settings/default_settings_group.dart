import 'package:flutter/material.dart';
import '../../theme/app_spacing.dart';
import 'settings_section_card.dart';
import 'settings_list_tile.dart';

/// Default settings group widget for encapsulating settings sections
/// 
/// This widget provides a clean way to create settings sections with
/// consistent styling and structure. It uses SettingsSectionCard as base
/// and automatically handles the layout of SettingsListTile items.
class DefaultSettingsGroup extends StatelessWidget {
  const DefaultSettingsGroup({
    super.key,
    required this.title,
    required this.items,
    this.padding,
  });

  /// Section title
  final String title;

  /// List of settings items for this section
  final List<SettingsListTile> items;

  /// Padding for the section (defaults to AppSpacing.mdPadding)
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final effectivePadding = padding ?? AppSpacing.mdPadding;

    return SettingsSectionCard(
      title: title,
      padding: effectivePadding,
      children: items,
    );
  }
} 

