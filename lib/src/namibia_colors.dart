import 'package:flutter/widgets.dart';

/// Every colour sampled from the article's photographs — there is no artwork.
///
/// A photograph's colour is the plate's times the light on it, so each is
/// white-balanced against a white on the same plate (its ink or frame) before
/// it is written here. The yellow plates carry no white: [yellow] is the
/// brighter of the two photographs (`B18805`) scaled so its red channel is
/// full, and [black] is that photograph's ink as sampled.
abstract final class NamibiaColors {
  static const Color white = Color(0xFFFFFFFF);

  /// Standard field, from `Namibian_license_plate_2.JPG`.
  static const Color yellow = Color(0xFFFFC407);

  /// Standard ink and frame, from the same photograph.
  static const Color black = Color(0xFF29221B);

  /// Personalised ink and frame: `394D8C` balanced against the white field
  /// `D1DAE2`. A mid blue — the article's "light blue" is the prose.
  static const Color blue = Color(0xFF455A9E);

  /// Diplomatic field: `E3371C` balanced against the white ink `F1E2DC`.
  static const Color red = Color(0xFFF03E20);

  /// Government field: `1EA878` balanced against the white ink `B7E3E7`. The
  /// police photograph balances to `2BA08D`; the article gives the two one
  /// colour, and that photograph's field is visibly unevenly lit, so the
  /// cleaner government sample stands for both.
  static const Color green = Color(0xFF2ABD84);

  /// Shown on a red field, where the default alert colour would vanish.
  static const Color alertOnRed = Color(0xFF1A1A1A);

  static const Color inactiveOnLight = Color(0xFFB0B0B0);
  static const Color inactiveOnDark = Color(0x80FFFFFF);
}
