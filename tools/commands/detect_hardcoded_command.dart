import 'dart:io';

/// Command to detect hardcoded values in Dart files
class DetectHardcodedCommand {
  static const String _commandName = 'detect-hardcoded';
  static const String _description = 'Detect hardcoded values in Dart files';

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

  /// Hardcoded patterns to detect
  static const List<String> _hardcodedPatterns = [
    'EdgeInsets.all(',
    'EdgeInsets.only(',
    'EdgeInsets.symmetric(',
    'EdgeInsets.fromLTRB(',
    'SizedBox(height:',
    'SizedBox(width:',
    'Container(height:',
    'Container(width:',
    'Padding(padding:',
    'Margin(margin:',
    'BorderRadius.circular(',
    'BorderRadius.only(',
    'BorderRadius.all(',
    'TextStyle(',
    'Color(',
    'Colors.',
    'fontSize:',
    'fontWeight:',
    'letterSpacing:',
    'height:',
    'width:',
    'radius:',
    'borderRadius:',
    'padding:',
    'margin:',
  ];

  /// Run the detect-hardcoded command
  static Future<void> run(List<String> arguments) async {
    if (arguments.isEmpty) {
      print('❌ Error: Please provide a directory path');
      print('Usage: dart run tools/shieldrig_cli.dart $_commandName <directory>');
      return;
    }

    final directory = arguments.first;
    final dir = Directory(directory);
    
    if (!dir.existsSync()) {
      print('❌ Error: Directory "$directory" does not exist');
      return;
    }

    print('🔍 Scanning for hardcoded values in: $directory');
    print('─' * 60);

    final issues = await _scanDirectory(directory);
    
    if (issues.isEmpty) {
      print('✅ No hardcoded values found!');
      return;
    }

    print('❌ Found ${issues.length} potential hardcoded values:');
    print('─' * 60);
    
    for (final issue in issues) {
      print('📁 ${issue.filePath}');
      print('   Line ${issue.lineNumber}: ${issue.code.trim()}');
      print('   💡 Suggestion: ${issue.suggestion}');
      print('');
    }

    print('📊 Summary:');
    print('   • Total issues: ${issues.length}');
    print('   • Files affected: ${issues.map((i) => i.filePath).toSet().length}');
    print('');
    print('💡 Use the design system values instead:');
    print('   • context.spacing.md instead of EdgeInsets.all(16)');
    print('   • context.colors.primary instead of Colors.blue');
    print('   • context.textStyle.body instead of TextStyle(fontSize: 16)');
    print('   • AppRadius.defaultRadius.smRadius instead of BorderRadius.circular(8)');
  }

  /// Scan directory for hardcoded values
  static Future<List<HardcodedIssue>> _scanDirectory(String directory) async {
    final issues = <HardcodedIssue>[];
    final files = _getDartFiles(directory);
    
    for (final file in files) {
      try {
        final content = await File(file).readAsString();
        final lines = content.split('\n');
        
        for (int i = 0; i < lines.length; i++) {
          final line = lines[i];
          final lineNumber = i + 1;
          
          // Check for hardcoded patterns
          for (final pattern in _hardcodedPatterns) {
            if (line.contains(pattern) && !_isAllowedPattern(line)) {
              issues.add(HardcodedIssue(
                filePath: file,
                lineNumber: lineNumber,
                code: line.trim(),
                suggestion: _getSuggestion(line, pattern),
              ));
              break;
            }
          }
        }
      } catch (e) {
        // Skip files that can't be read
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
        files.add(entity.path);
      }
    }
    
    return files;
  }

  /// Check if a line contains allowed patterns
  static bool _isAllowedPattern(String line) {
    for (final pattern in _allowedPatterns) {
      if (line.contains(pattern)) return true;
    }
    return false;
  }

  /// Get suggestion for hardcoded pattern
  static String _getSuggestion(String line, String pattern) {
    if (pattern.contains('EdgeInsets.all(')) {
      return 'Use context.spacing.md instead of hardcoded EdgeInsets';
    }
    if (pattern.contains('EdgeInsets.only(') || pattern.contains('EdgeInsets.symmetric(')) {
      return 'Use context.spacing values instead of hardcoded EdgeInsets';
    }
    if (pattern.contains('SizedBox(height:') || pattern.contains('SizedBox(width:')) {
      return 'Use AppSizes or context.sizes instead of hardcoded SizedBox';
    }
    if (pattern.contains('BorderRadius.circular(')) {
      return 'Use AppRadius.defaultRadius instead of hardcoded BorderRadius';
    }
    if (pattern.contains('TextStyle(')) {
      return 'Use context.textStyle instead of hardcoded TextStyle';
    }
    if (pattern.contains('Color(') || pattern.contains('Colors.')) {
      return 'Use context.colors instead of hardcoded colors';
    }
    if (pattern.contains('fontSize:') || pattern.contains('fontWeight:')) {
      return 'Use context.textStyle instead of hardcoded text properties';
    }
    return 'Consider using design system values instead of hardcoded values';
  }
}

/// Public issue representation
class HardcodedIssue {
  final String filePath;
  final int lineNumber;
  final String code;
  final String suggestion;

  HardcodedIssue({
    required this.filePath,
    required this.lineNumber,
    required this.code,
    required this.suggestion,
  });
} 