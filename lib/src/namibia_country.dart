import 'package:plate_core/plate_core.dart';

import 'namibia_colors.dart';

/// The flag on a personalised plate, printed straight on the white field with
/// no caption: `NA` is printed at character size, so it is a label on the
/// spec. The only plate here with a panel; the rest set `noPanel`.
///
/// The flag is the SVG asset rather than painted stripes: its twelve-point
/// sun is not something a [PlateSection] can draw.
abstract final class NamibiaCountry {
  static const PlateCountry namibia = PlateCountry(
    code: 'na',
    captionLines: <String>[],
    panelColor: NamibiaColors.white,
    panelTextColor: NamibiaColors.blue,
    flagAspectRatio: 1.5,
    flag: SvgPlateAsset(
      'assets/flags/Flag_of_Namibia.svg',
      package: 'namibia_plate',
    ),
  );
}
