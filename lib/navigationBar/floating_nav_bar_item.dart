import 'package:flutter/material.dart';
import 'package:personal_project/app_localizations.dart';

class FloatingNavbarItem {
  final String? title;
  final IconData? icon;
  final Widget? customWidget;

  FloatingNavbarItem({
    this.icon,
    this.title,
    this.customWidget,
  });
}
