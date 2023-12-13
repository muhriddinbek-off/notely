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
}
