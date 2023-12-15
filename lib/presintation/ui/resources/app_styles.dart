import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle getNotes() => const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getCategory() => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      );
  static TextStyle getTask() => const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      );
  static TextStyle getTaskSubtitle() => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      );
  static TextStyle getAddTitle() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      );
  static TextStyle getSplash() => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      );
}
