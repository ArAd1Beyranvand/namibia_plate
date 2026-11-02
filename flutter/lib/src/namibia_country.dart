import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'namibia_colors.dart';

/// The personalised plate prints the flag on its white field, with `NA` as a
/// label on the spec. It is the only plate here with a panel; the rest set
/// `noPanel`.
abstract final class NamibiaCountry {
  static const PlateDrawing _flag = PlateDrawing(90, 60, <PlateShape>[
    PlateRectShape(0, 0, 90, 60, Color(0xFF009A44)),
    PlatePolygonShape(<Offset>[
      Offset(0, 60),
      Offset(0, 0),
      Offset(90, 0),
    ], Color(0xFF002F6C)),
    PlatePolygonShape(<Offset>[
      Offset(0, 47.981),
      Offset(71.971, 0),
      Offset(90, 0),
      Offset(90, 12.019),
      Offset(18.029, 60),
      Offset(0, 60),
    ], Color(0xFFFFFFFF)),
    PlatePolygonShape(<Offset>[
      Offset(0, 50.986),
      Offset(76.479, 0),
      Offset(90, 0),
      Offset(90, 9.014),
      Offset(13.521, 60),
      Offset(0, 60),
    ], Color(0xFFC8102E)),
    PlateStarShape(
      18,
      16.341,
      10,
      Color(0xFFFFCD00),
      points: 12,
      innerRatio: 0.6,
    ),
    PlateRingShape(18, 16.341, 5.5, 1, Color(0xFF002F6C)),
  ]);

  static const PlateCountry namibia = PlateCountry(
    code: 'na',
    captionLines: <String>[],
    panelColor: NamibiaColors.white,
    panelTextColor: NamibiaColors.blue,
    flagAspectRatio: 1.5,
    flag: _flag,
  );
}
