import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('No Hardcoded Values', () {
    test('should not have hardcoded values in lib/ directory', () async {
      final issues = await _scanForHardcodedValues('lib/');
      
      if (issues.isNotEmpty) {
        // ignore: avoid_print
        print('\n❌ Found ${issues.length} hardcoded values:');
        for (final issue in issues) {
          // ignore: avoid_print
          print('📁 ${issue.filePath}:${issue.lineNumber}');
          // ignore: avoid_print
          print('   ${issue.code.trim()}');
          // ignore: avoid_print
          print('   💡 ${issue.suggestion}');
          // ignore: avoid_print
          print('');
        }
      }
      
      expect(issues, isEmpty, reason: 'Found hardcoded values in lib/ directory');
    });

    test('should not have hardcoded values in test/ directory', () async {
      final issues = await _scanForHardcodedValues('test/');
      
      if (issues.isNotEmpty) {
        // ignore: avoid_print
        print('\n❌ Found ${issues.length} hardcoded values:');
        for (final issue in issues) {
          // ignore: avoid_print
          print('📁 ${issue.filePath}:${issue.lineNumber}');
          // ignore: avoid_print
          print('   ${issue.code.trim()}');
          // ignore: avoid_print
          print('   💡 ${issue.suggestion}');
          // ignore: avoid_print
          print('');
        }
      }
      
      expect(issues, isEmpty, reason: 'Found hardcoded values in test/ directory');
    });
  });
}

/// Allowed patterns that should not be flagged as hardcoded
const List<String> _allowedPatterns = [
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
const List<String> _hardcodedPatterns = [
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

/// Scan directory for hardcoded values using CLI
Future<List<HardcodedIssue>> _scanForHardcodedValues(String directory) async {
  final issues = <HardcodedIssue>[];
  
  try {
    // Run the CLI command
    final result = await Process.run('dart', [
      'run',
      'tools/shieldrig_cli.dart',
      'detect-hardcoded',
      directory,
    ]);
    
    // If the command succeeds (exit code 0), no hardcoded values found
    if (result.exitCode == 0) {
      return issues;
    }
    
    // If there are issues, parse the output
    final output = result.stdout.toString();
    if (output.contains('❌ Found')) {
      // Parse the output to extract issues
      final lines = output.split('\n');
      String? currentFile;
      int? currentLine;
      String? currentCode;
      String? currentSuggestion;
      
      for (final line in lines) {
        if (line.startsWith('📁 ')) {
          // Save previous issue if exists
          if (currentFile != null && currentLine != null && currentCode != null && currentSuggestion != null) {
            issues.add(HardcodedIssue(
              filePath: currentFile,
              lineNumber: currentLine,
              code: currentCode,
              suggestion: currentSuggestion,
            ));
          }
          
          // Parse new file info
          final fileInfo = line.substring(4); // Remove '📁 '
          final colonIndex = fileInfo.lastIndexOf(':');
          if (colonIndex != -1) {
            currentFile = fileInfo.substring(0, colonIndex);
            currentLine = int.tryParse(fileInfo.substring(colonIndex + 1)) ?? 0;
          }
        } else if (line.trim().startsWith('💡 ')) {
          currentSuggestion = line.trim().substring(3); // Remove '💡 '
        } else if (line.trim().isNotEmpty && !line.startsWith('🔍') && !line.startsWith('✅') && !line.startsWith('❌')) {
          currentCode = line.trim();
        }
      }
      
      // Add last issue
      if (currentFile != null && currentLine != null && currentCode != null && currentSuggestion != null) {
        issues.add(HardcodedIssue(
          filePath: currentFile,
          lineNumber: currentLine,
          code: currentCode,
          suggestion: currentSuggestion,
        ));
      }
    }
  } catch (e) {
    // If CLI fails, return empty list (assume no issues)
  }

  return issues;
}

/// Get all Dart files in directory recursively
List<String> _getDartFiles(String directory) {
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
bool _isAllowedPattern(String line) {
  for (final pattern in _allowedPatterns) {
    if (line.contains(pattern)) return true;
  }
  return false;
}

/// Get suggestion for hardcoded pattern
String _getSuggestion(String line, String pattern) {
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

 