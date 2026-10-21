import 'package:flutter/widgets.dart';

/// Colours sampled from the article's photographs, each white-balanced
/// against a white on the same plate. The yellow plates carry no white:
/// [yellow] is the brighter photograph scaled so its red channel is full.
abstract final class NamibiaColors {
  static const Color white = Color(0xFFFFFFFF);

  static const Color yellow = Color(0xFFFFC407);

  static const Color black = Color(0xFF29221B);

  static const Color blue = Color(0xFF455A9E);

  static const Color red = Color(0xFFF03E20);

  /// The police photograph balances to `2BA08D`, but its field is unevenly
  /// lit; the cleaner government sample stands for both.
  static const Color green = Color(0xFF2ABD84);

  /// Shown on a red field, where the default alert colour would vanish.
  static const Color alertOnRed = Color(0xFF1A1A1A);

  static const Color inactiveOnLight = Color(0xFFB0B0B0);
  static const Color inactiveOnDark = Color(0x80FFFFFF);
}
