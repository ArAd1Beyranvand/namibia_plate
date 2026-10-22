import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'namibia_alphabets.dart';
import 'namibia_country.dart';
import 'namibia_regions.dart';

/// Where the ink sits, in plate coordinates, measured off the article's
/// photographs normalised to 520x110. Only the standard plate has a documented
/// size; the other designs share its canvas, scaled along each axis.
///
/// Reference caps are ~73-79 of the 110 height. `glyphStyle` paints ink at
/// ~0.53 of the box, so matching would need a ~145 box; the rows fill the
/// plate (106) and the ink comes out at ~75% of the reference.
abstract final class _Layout {
  static const double width = 520;
  static const double height = 110;
  static const double rowTop = 2;
  static const double rowHeight = 106;

  /// Standard: `N` ink 16.2..57.6, centre 36.9 (`N 108-053 W`).
  static const double nationCentre = 37;
  static const double cell = 56;

  /// Standard region letter centre: `W` 479.7, `S` 461.6 (lower-res photo);
  /// the sharper one is used. Two letters stack leftwards on [regionCell].
  static const double regionLastCentre = 480;

  /// A town-code cell. The reference's `W` inks 40 wide in a condensed face;
  /// a slot scales a glyph down to fit its cell, and DejaVu's `W` and `M` need
  /// ~70 to print at full height. The right margin has the room.
  static const double regionCell = 70;

  /// Standard digit run centre: 262.5 (`108-053`), 258.5 (`12181`).
  static const double digitCentre = 260;

  /// Standard digit pitch: 55.5 (`108-053`), 57.3 (`12181`, lower res).
  static const double digitPitch = 55.5;

  /// The dash of a six-digit number: 220.4→305.7 between the digits either
  /// side of it is the pitch plus 30. Dash ink 253.9..272.2, y 51.7..62.6.
  static const double dashGap = 30;

  /// Personalised (`OSAMA1`): ink 10.0..334.8, centres 30.5..315.2, pitch 57.
  static const double personalLeft = 2;
  static const double personalPitch = 57;
  static const double personalRight = 344;

  /// Personalised flag ink x 339.5..381.9, y 40.7..66.7.
  static const PlatePanel flag = PlatePanel(
    box: PlateBox(339.5, 40.7, 42.4, 26),
    padding: EdgeInsets.zero,
  );

  /// Personalised `NA`: centres 432.8 / 488.4. A label does not shrink to
  /// its box as a slot does, so at the row height `NA` ran off the plate and
  /// outsized the slot glyphs beside it; [naGlyph] brings it back to them.
  static const double naCentre = 460.6;
  static const double naGlyph = 88;

  /// Diplomatic `013 CD 02 N`: mission centres 54.3/96.5/138.7 (pitch 42.2);
  /// `CD` 218.2/272.4; serial `0` at 345.4, the `2` read by eye at ~400
  /// (dirt splits its ink); `N` 466.4.
  ///
  /// The mission register is widened from the measured 42.2 pitch to 50
  /// (centres 55/105/155): at 42 the slots shrank DejaVu's digits well below
  /// the serial's, where the reference prints them the same size.
  static const double missionLeft = 30;
  static const double missionRight = 180;
  static const double cdCentre = 245.3;
  static const double diplomaticSerialLeft = 317.9;
  static const double diplomaticSerialRight = 427.9;
  static const double diplomaticNationCentre = 466.4;

  /// Government: prefix centres GRN 40.3/90.6/150.0, POL 33.1/88.6/143.8
  /// (pitch 55); digits right-aligned, last centre 481 (GRN 32872) and 473.8
  /// (POL 8006), pitch 54.4 / 56.4.
  ///
  /// The prefix's ink starts at x 18.4 (GRN) and 13 (POL, the frame's inner
  /// edge in that photo); [prefixLeft] keeps it clear of the frame. DejaVu's
  /// caps advance ~[prefixAdvance] at the row height, so a three-letter
  /// prefix inks ~156 wide. `NAM1`–`NAM3` are not photographed; at full
  /// height they would run into the digits, so a four-character prefix is
  /// printed at three quarters of it, in the width of three.
  static const double prefixLeft = 18;
  static const double prefixAdvance = 52;
  static const double governmentDigitsRight = 505.5;
  static const double governmentPitch = 55;

  static const PlatePanel none = PlatePanel(box: PlateBox(0, 0, 0, 0), padding: EdgeInsets.zero);
}

/// The current designs. Colour lives on `NamibiaThemes`.
///
/// Only the post-independence series is implemented; the South West Africa
/// `S`-prefixed series (1968–1990) and the earlier unprefixed codes are not.
/// The presidential seal plate has no number and is not implemented.
abstract final class NamibiaPlates {
  /// A label centred on [centre]. Text wider than its box starts at the box's
  /// left and spills right, so the box is made wider than the ink (DejaVu
  /// Bold caps reach ~64 at this height) as far as the plate edge allows.
  static PlateLabel _label(String text, double centre, {double glyphHeight = _Layout.rowHeight}) {
    final half = min(32.0 * text.length + 8, min(centre, _Layout.width - centre));
    return PlateLabel(
      text: text,
      box: PlateBox(centre - half, _Layout.rowTop, 2 * half, _Layout.rowHeight),
      glyphHeight: glyphHeight,
    );
  }

  /// [count] cells between [left] and [right], as one slot.
  static PlateSlot _run(PlateAlphabet alphabet, int count, double left, double right) => PlateSlot(
    alphabet: alphabet,
    box: PlateBox(left, _Layout.rowTop, right - left, _Layout.rowHeight),
    length: count,
    spacing: max(0, (right - left) / count - 0.6 * 0.72 * _Layout.rowHeight),
  );

  /// Standard yellow plate, `N 123-456 W`: `N`, [digits] (1–6) issued in
  /// sequence per town, then a town code of [regionLetters] (1–2).
  ///
  /// `N` hugs the left edge and the town code the right; the digits are
  /// centred between them on [_Layout.digitPitch], closing up when a long
  /// number meets a two-letter code. Only the six-and-one and five-and-one
  /// forms are photographed; the others follow the same rule.
  static PlateSpec standard({required int digits, int regionLetters = 1}) {
    assert(digits >= 1 && digits <= 6 && regionLetters >= 1 && regionLetters <= 2);
    final regionLeft =
        _Layout.regionLastCentre -
        (regionLetters - 1) * _Layout.regionCell -
        _Layout.regionCell / 2;
    const left = _Layout.nationCentre + _Layout.cell / 2;
    final dash = digits == 6 ? _Layout.dashGap : 0.0;
    final room = regionLeft - left;
    final pitch = ((room - dash) / digits).clamp(0.0, _Layout.digitPitch);
    final run = pitch * digits + dash;
    final start = (_Layout.digitCentre - run / 2).clamp(left, regionLeft - run);

    final List<PlateSlot> serial;
    final int regionSlot;
    final labels = <PlateLabel>[_label('N', _Layout.nationCentre)];
    final List<PlateTextGroup> groups;
    if (digits == 6) {
      final mid = start + pitch * 3;
      regionSlot = 2;
      serial = [
        _run(NamibiaAlphabets.digits, 3, start, mid),
        _run(NamibiaAlphabets.digits, 3, mid + dash, mid + dash + pitch * 3),
      ];
      labels.add(
        PlateLabel(
          text: '-',
          box: PlateBox(mid + dash / 2 - 15, _Layout.rowTop, 30, _Layout.rowHeight),
          glyphHeight: _Layout.rowHeight,
        ),
      );
      groups = [
        const PlateTextGroup([0], key: 'serial', prefix: 'N '),
        const PlateTextGroup([1], key: 'serialTail', prefix: '-'),
      ];
    } else {
      regionSlot = 1;
      serial = [_run(NamibiaAlphabets.digits, digits, start, start + pitch * digits)];
      groups = [
        const PlateTextGroup([0], key: 'serial', prefix: 'N '),
      ];
    }

    return PlateSpec(
      id: 'na.standard.$digits.$regionLetters',
      country: NamibiaCountry.namibia,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: _Layout.none,
      noPanel: true,
      slots: [
        ...serial,
        _run(
          NamibiaAlphabets.region,
          regionLetters,
          regionLeft,
          regionLeft + regionLetters * _Layout.regionCell,
        ),
      ],
      labels: labels,
      textGroups: [
        ...groups,
        PlateTextGroup([regionSlot], key: 'region', prefix: ' '),
      ],
      resolveRegion: NamibiaRegions.captionOf,
    );
  }

  /// Personalised, `OSAMA1 [flag] NA`: [length] (1–7) letters or digits in
  /// blue on white. Up to six keep the photographed pitch; seven close up to
  /// fit before the flag.
  static PlateSpec personalised({int length = 7}) {
    assert(length >= 1 && length <= 7);
    final right = (_Layout.personalLeft + _Layout.personalPitch * length).clamp(
      0.0,
      _Layout.personalRight,
    );
    return PlateSpec(
      id: 'na.personalised.$length',
      country: NamibiaCountry.namibia,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: _Layout.flag,
      slots: [_run(NamibiaAlphabets.personalised, length, _Layout.personalLeft, right)],
      labels: [_label('NA', _Layout.naCentre, glyphHeight: _Layout.naGlyph)],
      textGroups: const [
        PlateTextGroup([0], key: 'text'),
      ],
    );
  }

  /// Diplomatic, `013 CD 02 N`: a three-digit mission code and a two-digit
  /// serial, white on red. The article lists no mission codes, so nothing
  /// here is specific to any country and none is refused.
  static final PlateSpec diplomatic = PlateSpec(
    id: 'na.diplomatic',
    country: NamibiaCountry.namibia,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    panel: _Layout.none,
    noPanel: true,
    slots: [
      _run(NamibiaAlphabets.digits, 3, _Layout.missionLeft, _Layout.missionRight),
      _run(NamibiaAlphabets.digits, 2, _Layout.diplomaticSerialLeft, _Layout.diplomaticSerialRight),
    ],
    labels: [_label('CD', _Layout.cdCentre), _label('N', _Layout.diplomaticNationCentre)],
    textGroups: const [
      PlateTextGroup([0], key: 'mission'),
      PlateTextGroup([1], key: 'serial', prefix: ' CD '),
    ],
  );

  /// The government prefixes, from the article. `NAM1`–`NAM3` are the
  /// former presidents' vehicles; `LNA`/`LNC` the legislature since 2024.
  static const List<String> governmentPrefixes = <String>[
    'GRN', 'JUD', 'NDF', 'POL', 'NCS', 'LNA', 'LNC', 'NAM1', 'NAM2', 'NAM3', //
  ];

  /// Government, `GRN 32872`: [prefix] printed at the left, [digits] (1–5)
  /// right-aligned, white on green. The prefix is fixed print, not input.
  static PlateSpec government({required String prefix, required int digits}) {
    // Eight characters is what the 520 width holds: GRN + five measured.
    assert(digits >= 1 && prefix.length + digits <= 8);
    const right = _Layout.governmentDigitsRight;
    return PlateSpec(
      id: 'na.government.${prefix.toLowerCase()}.$digits',
      country: NamibiaCountry.namibia,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: _Layout.none,
      noPanel: true,
      slots: [
        _run(NamibiaAlphabets.digits, digits, right - _Layout.governmentPitch * digits, right),
      ],
      labels: [
        _label(
          prefix,
          _Layout.prefixLeft + _Layout.prefixAdvance * 3 / 2,
          glyphHeight: _Layout.rowHeight * 3 / prefix.length.clamp(3, 4),
        ),
      ],
      textGroups: [
        PlateTextGroup(const [0], key: 'serial', prefix: '$prefix '),
      ],
    );
  }

  /// Windhoek, `N 123-456 W`.
  static final PlateSpec windhoek = standard(digits: 6);

  /// Walvis Bay, `N 123-456 WB`.
  static final PlateSpec sixTwoLetter = standard(digits: 6, regionLetters: 2);

  /// `N 12181 S`.
  static final PlateSpec fiveDigit = standard(digits: 5);

  /// `N 1234 KM`.
  static final PlateSpec fourDigitTwoLetter = standard(digits: 4, regionLetters: 2);

  static final PlateSpec personalisedSix = personalised(length: 6);
  static final PlateSpec personalisedSeven = personalised();
  static final PlateSpec grn = government(prefix: 'GRN', digits: 5);
  static final PlateSpec police = government(prefix: 'POL', digits: 4);
  static final PlateSpec nam1 = government(prefix: 'NAM1', digits: 4);

  static final List<PlateSpec> all = [
    windhoek,
    sixTwoLetter,
    fiveDigit,
    fourDigitTwoLetter,
    personalisedSix,
    personalisedSeven,
    diplomatic,
    grn,
    police,
    nam1,
  ];
}
