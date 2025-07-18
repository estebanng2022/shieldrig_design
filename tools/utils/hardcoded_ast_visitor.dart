import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/source/line_info.dart';

/// AST Visitor para detectar valores hardcodeados en código Dart
/// 
/// Este visitor analiza el AST completo para encontrar valores hardcodeados
/// que no están usando el design system, incluso si están en estructuras
/// complejas o múltiples líneas.
class HardcodedAstVisitor extends GeneralizingAstVisitor<void> {
  final String filePath;
  final LineInfo lineInfo;
  final void Function(HardcodedIssue) onViolation;
  final List<String> allowedPatterns;
  final List<String> excludedFiles;

  HardcodedAstVisitor({
    required this.filePath,
    required this.lineInfo,
    required this.onViolation,
    required this.allowedPatterns,
    required this.excludedFiles,
  });

  void _report(AstNode node, String suggestion) {
    final offset = node.offset;
    final location = lineInfo.getLocation(offset);
    final lineNumber = location.lineNumber;
    onViolation(HardcodedIssue(
      filePath: filePath,
      lineNumber: lineNumber,
      code: node.toSource(),
      suggestion: suggestion,
    ));
  }

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    // Detectar EdgeInsets.all(), EdgeInsets.symmetric(), etc.
    if (_isEdgeInsetsCreation(node)) {
      _checkForHardcodedEdgeInsets(node);
    }
    
    // Detectar BorderRadius.circular(), BorderRadius.all(), etc.
    if (_isBorderRadiusCreation(node)) {
      _checkForHardcodedBorderRadius(node);
    }
    
    // Detectar TextStyle() con valores hardcodeados
    if (_isTextStyleCreation(node)) {
      _checkForHardcodedTextStyle(node);
    }
    
    // Detectar SizedBox() con valores hardcodeados
    if (_isSizedBoxCreation(node)) {
      _checkForHardcodedSizedBox(node);
    }
    
    // Detectar Container() con valores hardcodeados
    if (_isContainerCreation(node)) {
      _checkForHardcodedContainer(node);
    }
    
    super.visitInstanceCreationExpression(node);
  }

  @override
  void visitPrefixedIdentifier(PrefixedIdentifier node) {
    // Detectar Colors.red, Colors.blue, etc.
    if (_isColorsPrefixed(node)) {
      _checkForHardcodedColors(node);
    }
    
    super.visitPrefixedIdentifier(node);
  }

  @override
  void visitIntegerLiteral(IntegerLiteral node) {
    // Detectar valores numéricos hardcodeados en contextos específicos
    _checkForHardcodedNumericValue(node);
    super.visitIntegerLiteral(node);
  }

  @override
  void visitDoubleLiteral(DoubleLiteral node) {
    // Detectar valores double hardcodeados en contextos específicos
    _checkForHardcodedNumericValue(node);
    super.visitDoubleLiteral(node);
  }

  /// Verificar si es una creación de EdgeInsets
  bool _isEdgeInsetsCreation(InstanceCreationExpression node) {
    return node.constructorName.name == 'EdgeInsets' ||
           node.constructorName.name == 'all' ||
           node.constructorName.name == 'symmetric' ||
           node.constructorName.name == 'only' ||
           node.constructorName.name == 'fromLTRB';
  }

  /// Verificar si es una creación de BorderRadius
  bool _isBorderRadiusCreation(InstanceCreationExpression node) {
    return node.constructorName.name == 'BorderRadius' ||
           node.constructorName.name == 'circular' ||
           node.constructorName.name == 'all' ||
           node.constructorName.name == 'only';
  }

  /// Verificar si es una creación de TextStyle
  bool _isTextStyleCreation(InstanceCreationExpression node) {
    return node.constructorName.name == 'TextStyle';
  }

  /// Verificar si es una creación de SizedBox
  bool _isSizedBoxCreation(InstanceCreationExpression node) {
    return node.constructorName.name == 'SizedBox';
  }

  /// Verificar si es una creación de Container
  bool _isContainerCreation(InstanceCreationExpression node) {
    return node.constructorName.name == 'Container';
  }

  /// Verificar si es un prefijo de Colors
  bool _isColorsPrefixed(PrefixedIdentifier node) {
    return node.prefix.name == 'Colors';
  }

  /// Verificar si el código contiene patrones permitidos
  bool _containsAllowedPattern(String code) {
    for (final pattern in allowedPatterns) {
      if (code.contains(pattern)) {
        return true;
      }
    }
    return false;
  }

  /// Verificar si el archivo está excluido
  bool _isFileExcluded() {
    for (final excludedFile in excludedFiles) {
      if (filePath.contains(excludedFile)) {
        return true;
      }
    }
    return false;
  }

  /// Verificar EdgeInsets hardcodeados
  void _checkForHardcodedEdgeInsets(InstanceCreationExpression node) {
    if (_isFileExcluded()) return;
    
    final code = node.toString();
    if (_containsAllowedPattern(code)) return;
    
    // Detectar valores hardcodeados en EdgeInsets
    if (code.contains('EdgeInsets.all(') ||
        code.contains('EdgeInsets.symmetric(') ||
        code.contains('EdgeInsets.only(') ||
        code.contains('EdgeInsets.fromLTRB(')) {
      
      _report(node, 'Use context.spacing values instead of hardcoded EdgeInsets');
    }
  }

  /// Verificar BorderRadius hardcodeados
  void _checkForHardcodedBorderRadius(InstanceCreationExpression node) {
    if (_isFileExcluded()) return;
    
    final code = node.toString();
    if (_containsAllowedPattern(code)) return;
    
    // Detectar valores hardcodeados en BorderRadius
    if (code.contains('BorderRadius.circular(') ||
        code.contains('BorderRadius.all(') ||
        code.contains('BorderRadius.only(')) {
      
      _report(node, 'Use AppRadius.defaultRadius instead of hardcoded BorderRadius');
    }
  }

  /// Verificar TextStyle hardcodeados
  void _checkForHardcodedTextStyle(InstanceCreationExpression node) {
    if (_isFileExcluded()) return;
    
    final code = node.toString();
    if (_containsAllowedPattern(code)) return;
    
    // Detectar valores hardcodeados en TextStyle
    if (code.contains('fontSize:') ||
        code.contains('fontWeight:') ||
        code.contains('letterSpacing:') ||
        code.contains('height:')) {
      
      _report(node, 'Use context.textStyle instead of hardcoded TextStyle');
    }
  }

  /// Verificar SizedBox hardcodeados
  void _checkForHardcodedSizedBox(InstanceCreationExpression node) {
    if (_isFileExcluded()) return;
    
    final code = node.toString();
    if (_containsAllowedPattern(code)) return;
    
    // Detectar valores hardcodeados en SizedBox
    if (code.contains('height:') ||
        code.contains('width:')) {
      
      _report(node, 'Use AppSizes or context.sizes instead of hardcoded SizedBox');
    }
  }

  /// Verificar Container hardcodeados
  void _checkForHardcodedContainer(InstanceCreationExpression node) {
    if (_isFileExcluded()) return;
    
    final code = node.toString();
    if (_containsAllowedPattern(code)) return;
    
    // Detectar valores hardcodeados en Container
    if (code.contains('height:') ||
        code.contains('width:')) {
      
      _report(node, 'Consider using design system values instead of hardcoded values');
    }
  }

  /// Verificar Colors hardcodeados
  void _checkForHardcodedColors(PrefixedIdentifier node) {
    if (_isFileExcluded()) return;
    
    final code = node.toString();
    if (_containsAllowedPattern(code)) return;
    
    // Detectar valores hardcodeados en Colors
    if (code.contains('Colors.') ||
        code.contains('Color(')) {
      
      _report(node, 'Use context.colors instead of hardcoded colors');
    }
  }

  /// Verificar valores numéricos hardcodeados
  void _checkForHardcodedNumericValue(Literal node) {
    if (_isFileExcluded()) return;
    
    // Solo verificar en contextos específicos donde los valores numéricos
    // podrían ser hardcodeados (como fontSize, padding, etc.)
    final parent = node.parent;
    if (parent is NamedExpression) {
      final name = parent.name.label.name;
      if (name == 'fontSize' ||
          name == 'height' ||
          name == 'width' ||
          name == 'padding' ||
          name == 'margin' ||
          name == 'borderRadius') {
        
        final code = parent.toString();
        if (_containsAllowedPattern(code)) return;
        
        _report(parent, 'Use context.textStyle instead of hardcoded text properties');
      }
    }
  }
}

/// Representación de un issue hardcodeado
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