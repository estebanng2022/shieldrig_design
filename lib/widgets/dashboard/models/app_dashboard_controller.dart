import 'package:flutter/material.dart';

/// Controller para navegación programática del dashboard
class AppDashboardController extends ChangeNotifier {
  AppDashboardController({int initialIndex = 0}) : _currentIndex = initialIndex;

  int _currentIndex;
  int get currentIndex => _currentIndex;

  /// Navegar a un tab específico
  void jumpToTab(int index) {
    if (index != _currentIndex) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  /// Animar a un tab específico
  void animateToTab(int index) {
    jumpToTab(index);
  }

  /// Navegar al siguiente tab
  void nextTab() {
    // Esto se implementará cuando tengamos acceso a la lista de tabs
    notifyListeners();
  }

  /// Navegar al tab anterior
  void previousTab() {
    // Esto se implementará cuando tengamos acceso a la lista de tabs
    notifyListeners();
  }
} 