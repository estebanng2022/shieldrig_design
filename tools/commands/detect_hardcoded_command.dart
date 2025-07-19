import 'dart:io';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/analysis/features.dart';
import 'package:path/path.dart' as p;
import '../utils/hardcoded_ast_visitor.dart';

/// Command to detect hardcoded values in Dart files
class DetectHardcodedCommand {
  static const String _commandName = 'detect-hardcoded';

  /// Allowed patterns that should not be flagged as hardcoded
  static const List<String> _allowedPatterns = [
    'AppSpacing',
    'AppRadius',
    'AppSizes',
    'AppTextStyle',
    'AppOpacities',
    'AppColors',
    'AppIcons',
    'context.spacing',
    'context.radius',
    'context.sizes',
    'context.textStyle',
    'context.colors',
    'context.icons',
    'AppRadius.defaultRadius',
    'AppSpacing.xs',
    'AppSpacing.sm',
    'AppSpacing.md',
    'AppSpacing.lg',
    'AppSpacing.xl',
    'AppSizes.iconSizeSm',
    'AppSizes.iconSizeMd',
    'AppSizes.iconSizeLg',
    'AppOpacities.shadow',
    'AppOpacities.disabled',
    'AppSpacing.xsVerticalGap',
    'AppSpacing.smVerticalGap',
    'AppSpacing.mdVerticalGap',
    'AppSpacing.lgVerticalGap',
    'AppSpacing.xlVerticalGap',
  ];

  /// Files that should be excluded from hardcoded detection (theme definitions)
  static const List<String> _excludedFiles = [
    'lib/theme/app_colors.dart',
    'lib/theme/app_spacing.dart',
    'lib/theme/app_radius.dart',
    'lib/theme/app_text_style.dart',
    'lib/theme/app_sizes.dart',
    'lib/theme/app_opacities.dart',
    'lib/theme/app_icons.dart',
  ];



  /// Run the detect-hardcoded command
  static Future<void> run(List<String> arguments) async {
    if (arguments.isEmpty) {
      // ignore: avoid_print
      print('❌ Error: Please provide a directory path');
      // ignore: avoid_print
      print('Usage: dart run tools/shieldrig_cli.dart $_commandName <directory>');
      return;
    }

    final directory = arguments.first;
    final dir = Directory(directory);
    
    if (!dir.existsSync()) {
      // ignore: avoid_print
      print('❌ Error: Directory "${dir.path}" does not exist');
      return;
    }

    // Convert to absolute and normalized path
    final absDirectory = p.normalize(dir.absolute.path);

    // ignore: avoid_print
    print('🔍 Scanning for hardcoded values in: $absDirectory');
    // ignore: avoid_print
    print('─' * 60);

    final issues = await _scanDirectory(absDirectory);
    
    if (issues.isEmpty) {
      // ignore: avoid_print
      print('✅ No hardcoded values found!');
      return;
    }

    // ignore: avoid_print
    print('❌ Found ${issues.length} potential hardcoded values:');
    // ignore: avoid_print
    print('─' * 60);
    
    for (final issue in issues) {
      // ignore: avoid_print
      print('📁 ${issue.filePath}');
      // ignore: avoid_print
      print('   Line ${issue.lineNumber}: ${issue.code.trim()}');
      // ignore: avoid_print
      print('   💡 Suggestion: ${issue.suggestion}');
      // ignore: avoid_print
      print('');
    }

    // ignore: avoid_print
    print('📊 Summary:');
    // ignore: avoid_print
    print('   • Total issues: ${issues.length}');
    // ignore: avoid_print
    print('   • Files affected: ${issues.map((i) => i.filePath).toSet().length}');
    // ignore: avoid_print
    print('');
    // ignore: avoid_print
    print('💡 Use the design system values instead:');
    // ignore: avoid_print
    print('   • context.spacing.md instead of EdgeInsets.all(16)');
    // ignore: avoid_print
    print('   • context.colors.primary instead of Colors.blue');
    // ignore: avoid_print
    print('   • context.textStyle.body instead of TextStyle(fontSize: 16)');
    // ignore: avoid_print
    print('   • AppRadius.defaultRadius.smRadius instead of BorderRadius.circular(8)');
  }

  /// Scan directory for hardcoded values using AST analysis
  static Future<List<HardcodedIssue>> _scanDirectory(String directory) async {
    final issues = <HardcodedIssue>[];
    final files = _getDartFiles(directory);
    
    for (final file in files) {
      if (_isExcludedFile(file)) {
        continue;
      }
      try {
        final parseResult = parseFile(path: file, featureSet: FeatureSet.latestLanguageVersion());
        final unit = parseResult.unit;
        final lineInfo = parseResult.lineInfo;
        final visitor = HardcodedAstVisitor(
          filePath: file,
          lineInfo: lineInfo,
          allowedPatterns: _allowedPatterns,
          excludedFiles: _excludedFiles,
          onViolation: (issue) => issues.add(issue),
        );
        unit.accept(visitor);
      } catch (e) {
        // ignore: avoid_print
        print('⚠️  Warning: Could not analyze file $file: $e');
      }
    }
    return issues;
  }

  /// Get all Dart files in directory recursively
  static List<String> _getDartFiles(String directory) {
    final files = <String>[];
    final dir = Directory(directory);
    
    if (!dir.existsSync()) return files;
    
    for (final entity in dir.listSync(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        files.add(p.normalize(entity.absolute.path));
      }
    }
    
    return files;
  }



  /// Check if a file should be excluded from hardcoded detection
  static bool _isExcludedFile(String filePath) {
    // Normalize path separators for cross-platform compatibility
    final normalizedPath = filePath.replaceAll('\\', '/');
    
    for (final excludedFile in _excludedFiles) {
      if (normalizedPath.contains(excludedFile)) return true;
    }
    return false;
  }


} 