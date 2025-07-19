import 'dart:io';

/// Analyze warnings command for ShieldRig CLI
/// 
/// Detects and groups warnings from dart analyze output
class AnalyzeWarningsCommand {


  /// Run the analyze-warnings command
  static Future<void> run(List<String> arguments) async {
    final hasFixFlag = arguments.contains('--fix');
    final directory = arguments.firstWhere(
      (arg) => !arg.startsWith('--'),
      orElse: () => '.',
    );

    // ignore: avoid_print
    print('🔍 Analyzing warnings in: $directory');
    // ignore: avoid_print
    print('─' * 60);

    final issues = await _runDartAnalyze(directory);
    
    if (issues.isEmpty) {
      // ignore: avoid_print
      print('✅ No warnings found!');
      return;
    }

    _displayResults(issues);
    
    if (hasFixFlag) {
      await _applyFixes(issues);
    }
  }

  /// Run dart analyze and parse output
  static Future<List<WarningIssue>> _runDartAnalyze(String directory) async {
    final issues = <WarningIssue>[];
    
    try {
      final result = await Process.run('dart', ['analyze', directory]);
      final output = result.stdout.toString();
      
      if (result.exitCode != 0) {
        // ignore: avoid_print
        print('⚠️  dart analyze exited with code ${result.exitCode}');
      }

      issues.addAll(_parseAnalyzeOutput(output));
    } catch (e) {
      // ignore: avoid_print
      print('❌ Error running dart analyze: $e');
    }
    
    return issues;
  }

  /// Parse dart analyze output
  static List<WarningIssue> _parseAnalyzeOutput(String output) {
    final issues = <WarningIssue>[];
    final lines = output.split('\n');
    
    for (final line in lines) {
      if (line.trim().isEmpty) continue;
      
      // Parse dart analyze output format
      // Example: "warning - file.dart:10:5 - message"
      final match = RegExp(r'(\w+)\s+-\s+([^:]+):(\d+):(\d+)\s+-\s+(.+)').firstMatch(line);
      if (match != null) {
        final level = match.group(1)!;
        final filePath = match.group(2)!;
        final lineNumber = int.parse(match.group(3)!);
        final columnNumber = int.parse(match.group(4)!);
        final message = match.group(5)!;
        
        // Filter for specific warning types
        if (_isTargetWarning(message)) {
          issues.add(WarningIssue(
            filePath: filePath,
            lineNumber: lineNumber,
            columnNumber: columnNumber,
            level: level,
            message: message,
            type: _getWarningType(message),
            suggestion: _getSuggestion(message),
          ));
        }
      }
    }
    
    return issues;
  }

  /// Check if warning is in our target list
  static bool _isTargetWarning(String message) {
    return message.contains('unused_') ||
           message.contains('depend_on_referenced_packages') ||
           message.contains('unrelated_type_equality_checks');
  }

  /// Get warning type for grouping
  static String _getWarningType(String message) {
    if (message.contains('unused_')) return 'unused';
    if (message.contains('depend_on_referenced_packages')) return 'dependency';
    if (message.contains('unrelated_type_equality_checks')) return 'type_check';
    return 'other';
  }

  /// Get suggestion for warning
  static String _getSuggestion(String message) {
    if (message.contains('unused_local_variable')) {
      return 'Remove variable or prefix with _ to indicate intentional non-use';
    }
    if (message.contains('unused_field')) {
      return 'Remove field or mark as @unused';
    }
    if (message.contains('unused_element')) {
      return 'Remove element or make public if intended for use';
    }
    if (message.contains('depend_on_referenced_packages')) {
      return 'Add missing dependency to pubspec.yaml';
    }
    if (message.contains('unrelated_type_equality_checks')) {
      return 'Fix type comparison - check for null safety';
    }
    return 'Review and fix according to Dart best practices';
  }

  /// Display results grouped by file
  static void _displayResults(List<WarningIssue> issues) {
    // ignore: avoid_print
    print('❌ Found ${issues.length} warnings:');
    // ignore: avoid_print
    print('─' * 60);
    
    // Group by file
    final groupedIssues = <String, List<WarningIssue>>{};
    for (final issue in issues) {
      groupedIssues.putIfAbsent(issue.filePath, () => []).add(issue);
    }
    
    for (final entry in groupedIssues.entries) {
      final filePath = entry.key;
      final fileIssues = entry.value;
      
      // ignore: avoid_print
      print('📁 $filePath');
      
      for (final issue in fileIssues) {
        // ignore: avoid_print
        print('   Line ${issue.lineNumber}: ${issue.message}');
        // ignore: avoid_print
        print('   💡 ${issue.suggestion}');
        // ignore: avoid_print
        print('');
      }
    }
    
    // ignore: avoid_print
    print('📊 Summary:');
    // ignore: avoid_print
    print('   • Total warnings: ${issues.length}');
    // ignore: avoid_print
    print('   • Files affected: ${groupedIssues.length}');
    // ignore: avoid_print
    print('');
    // ignore: avoid_print
    print('💡 Use --fix flag to apply automatic fixes');
  }

  /// Apply automatic fixes (placeholder for future implementation)
  static Future<void> _applyFixes(List<WarningIssue> issues) async {
    // ignore: avoid_print
    print('🔧 Applying automatic fixes...');
    // ignore: avoid_print
    print('⚠️  Auto-fix feature coming soon!');
    // ignore: avoid_print
    print('   For now, please fix warnings manually using the suggestions above.');
  }
}

/// Warning issue model
class WarningIssue {
  final String filePath;
  final int lineNumber;
  final int columnNumber;
  final String level;
  final String message;
  final String type;
  final String suggestion;

  WarningIssue({
    required this.filePath,
    required this.lineNumber,
    required this.columnNumber,
    required this.level,
    required this.message,
    required this.type,
    required this.suggestion,
  });
} 