#!/usr/bin/env dart

import 'dart:io';
import 'commands/detect_hardcoded_command.dart';

/// ShieldRig CLI - Design System Tools
/// 
/// Usage:
///   dart run tools/shieldrig_cli.dart <command> [arguments]
/// 
/// Commands:
///   detect-hardcoded <directory>  - Detect hardcoded values in Dart files
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
    case 'help':
    case '--help':
    case '-h':
      _showHelp();
      break;
    default:
      print('❌ Unknown command: $command');
      print('');
      _showHelp();
      exit(1);
  }
}

void _showHelp() {
  print('''
🛡️  ShieldRig CLI - Design System Tools

Usage:
  dart run tools/shieldrig_cli.dart <command> [arguments]

Commands:
  detect-hardcoded <directory>  - Detect hardcoded values in Dart files
  help                          - Show this help message

Examples:
  dart run tools/shieldrig_cli.dart detect-hardcoded lib/
  dart run tools/shieldrig_cli.dart detect-hardcoded test/
  dart run tools/shieldrig_cli.dart help

For more information, visit: https://github.com/shieldrig/shieldrig_design
''');
} 