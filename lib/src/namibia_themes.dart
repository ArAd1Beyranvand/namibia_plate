import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'namibia_colors.dart';

/// One ink on one field, the frame in the ink.
abstract final class NamibiaThemes {
  /// Frame ~4.5% of the height (outer plate edge to field, off the standard
  /// and government photographs); corners ~8%, estimated by eye from the
  /// same photographs — too small and too blurred to measure.
  static const double _border = 0.045;
  static const double _radius = 0.08;

  static PlateTheme _mono(
    Color field,
    Color ink,
    Color inactive, {
    Color alert = const Color(0xFFF87171),
  }) => PlateTheme.monochrome(
    field: field,
    ink: ink,
    inactive: inactive,
    borderWidthRatio: _border,
    plateRadiusRatio: _radius,
    alertColor: alert,
  );

  /// Black on fluorescent yellow.
  static final PlateTheme standard = _mono(
    NamibiaColors.yellow,
    NamibiaColors.black,
    NamibiaColors.inactiveOnLight,
  );

  /// Blue on white acrylic.
  static final PlateTheme personalised = _mono(
    NamibiaColors.white,
    NamibiaColors.blue,
    NamibiaColors.inactiveOnLight,
  );

  static final PlateTheme diplomatic = _mono(
    NamibiaColors.red,
    NamibiaColors.white,
    NamibiaColors.inactiveOnDark,
    alert: NamibiaColors.alertOnRed,
  );

  /// White on green: GRN, POL, NDF and every other government prefix.
  static final PlateTheme government = _mono(
    NamibiaColors.green,
    NamibiaColors.white,
    NamibiaColors.inactiveOnDark,
  );
}
