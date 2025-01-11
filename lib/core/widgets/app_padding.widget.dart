import 'package:flutter/material.dart';

class AppPadding extends InheritedWidget {
  const AppPadding({
    required this.padding,
    required super.child,
    super.key,
  });

  final EdgeInsets padding;

  static AppPadding of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppPadding>()!;
  }

  @override
  bool updateShouldNotify(AppPadding oldWidget) {
    return oldWidget.padding != padding;
  }
}