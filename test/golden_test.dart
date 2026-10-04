import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:namibia_plate/namibia_plate.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per design, rendered with a real bold face so the ink can be
/// measured against the article's photographs.
void main() {
  setUpAll(() async {
    final loader = FontLoader('Roboto');
    final file = File('/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf');
    if (file.existsSync()) {
      loader.addFont(file.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  List<String?> v(String s) => s.split('').toList();

  final cases = <(String, PlateSpec, PlateTheme, String)>[
    ('windhoek', NamibiaPlates.windhoek, NamibiaThemes.standard, '108053W'),
    ('six_two', NamibiaPlates.sixTwoLetter, NamibiaThemes.standard, '123456WB'),
    ('five', NamibiaPlates.fiveDigit, NamibiaThemes.standard, '12181S'),
    (
      'four_two',
      NamibiaPlates.fourDigitTwoLetter,
      NamibiaThemes.standard,
      '1234KM',
    ),
    (
      'personalised_6',
      NamibiaPlates.personalisedSix,
      NamibiaThemes.personalised,
      'OSAMA1',
    ),
    (
      'personalised_7',
      NamibiaPlates.personalisedSeven,
      NamibiaThemes.personalised,
      'NAMIB24',
    ),
    ('diplomatic', NamibiaPlates.diplomatic, NamibiaThemes.diplomatic, '01302'),
    ('grn', NamibiaPlates.grn, NamibiaThemes.government, '32872'),
    ('police', NamibiaPlates.police, NamibiaThemes.government, '8006'),
    ('nam1', NamibiaPlates.nam1, NamibiaThemes.government, '0001'),
  ];

  test('every spec has a golden', () {
    expect(cases.map((c) => c.$2).toSet(), NamibiaPlates.all.toSet());
  });

  for (final (name, spec, theme, values) in cases) {
    testWidgets(name, (tester) async {
      final controller = PlateController.fromValues(spec, v(values));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 520,
                height: 520 * spec.canvasHeight / spec.canvasWidth,
                child: PlateView(
                  controller: controller,
                  theme: theme,
                  country: NamibiaCountry.namibia,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/$name.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
