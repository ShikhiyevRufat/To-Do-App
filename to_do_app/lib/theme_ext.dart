import 'package:flutter/material.dart';

extension ThemeContextExtensions on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get primaryContainerColor => Theme.of(this).colorScheme.primaryContainer;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get secondaryContainerColor => Theme.of(this).colorScheme.secondaryContainer;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get backgroundColor => Theme.of(this).colorScheme.surface;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get onSecondaryColor => Theme.of(this).colorScheme.onSecondary;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;
  Color get onBackgroundColor => Theme.of(this).colorScheme.onSurface;
  Color get onErrorColor => Theme.of(this).colorScheme.onError;

}