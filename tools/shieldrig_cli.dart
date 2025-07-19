#!/usr/bin/env dart

import 'dart:io';
import 'commands/detect_hardcoded_command.dart';
import 'commands/analyze_warnings_command.dart';

/// ShieldRig CLI - Design System Tools
/// 
/// Usage:
///   dart run tools/shieldrig_cli.dart [command] [arguments]
///
/// Commands:
///   detect-hardcoded [directory]  - Detect hardcoded values in Dart files
///   help                          - Show this help message
void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    _showHelp();
    return;
  }

  final command = arguments.first;
  final commandArgs = arguments.skip(1).toList();

  switch (command) {
    case 'detect-hardcoded':
      await DetectHardcodedCommand.run(commandArgs);
      break;
    case 'analyze-warnings':
      await AnalyzeWarningsCommand.run(commandArgs);
      break;
    case 'help':
    case '--help':
    case '-h':
      _showHelp();
      break;
    default:
      // ignore: avoid_print
      print('❌ Unknown command: $command');
      // ignore: avoid_print
      print('');
      _showHelp();
      exit(1);
  }
}

void _showHelp() {
  // ignore: avoid_print
  print('''
🛡️  ShieldRig CLI - Design System Tools

Usage:
  dart run tools/shieldrig_cli.dart [command] [arguments]

Commands:
  detect-hardcoded [directory]  - Detect hardcoded values in Dart files
  analyze-warnings [directory]  - Analyze and group warnings from dart analyze
  help                          - Show this help message

Examples:
  dart run tools/shieldrig_cli.dart detect-hardcoded lib/
  dart run tools/shieldrig_cli.dart analyze-warnings lib/
  dart run tools/shieldrig_cli.dart analyze-warnings --fix
  dart run tools/shieldrig_cli.dart help

For more information, visit: https://github.com/shieldrig/shieldrig_design
''');
} 