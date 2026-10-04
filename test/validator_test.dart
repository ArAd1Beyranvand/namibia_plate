import 'package:flutter_test/flutter_test.dart';
import 'package:namibia_plate/namibia_plate.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  PlateEntry e(PlateSpec s, String v) => PlateEntry(
    spec: s,
    values: v.split('').map((c) => c == '_' ? null : c).toList(),
  );

  test('standard: known town valid, unknown flagged, quiet until town', () {
    const v = NamibiaPlateValidator();
    expect(v.validate(e(NamibiaPlates.windhoek, '108053W')).isValid, isTrue);
    expect(
      v.validate(e(NamibiaPlates.sixTwoLetter, '123456WB')).isValid,
      isTrue,
    );
    expect(v.validate(e(NamibiaPlates.windhoek, '108053Z')).isValid, isFalse);
    expect(v.validate(e(NamibiaPlates.windhoek, '10805__')).isValid, isTrue);
    expect(v.validate(e(NamibiaPlates.windhoek, '10805_W')).isValid, isFalse);
  });

  test('complete validator', () {
    const v = NamibiaCompleteValidator();
    expect(v.validate(e(NamibiaPlates.grn, '32872')).isValid, isTrue);
    expect(v.validate(e(NamibiaPlates.grn, '3287_')).isValid, isFalse);
  });

  test('every builder form passes debugValidateSpec', () {
    for (var d = 1; d <= 6; d++) {
      for (var r = 1; r <= 2; r++) {
        expect(
          debugValidateSpec(
            NamibiaPlates.standard(digits: d, regionLetters: r),
          ),
          isTrue,
        );
      }
    }
    for (var n = 1; n <= 7; n++) {
      expect(debugValidateSpec(NamibiaPlates.personalised(length: n)), isTrue);
    }
    for (final p in NamibiaPlates.governmentPrefixes) {
      expect(
        debugValidateSpec(
          NamibiaPlates.government(prefix: p, digits: 8 - p.length),
        ),
        isTrue,
      );
    }
  });
}
