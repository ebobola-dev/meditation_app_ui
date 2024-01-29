import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeUtils {
  static bool isDarkTheme() {
    final brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }
}
