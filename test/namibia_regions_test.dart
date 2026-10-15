import 'package:flutter_test/flutter_test.dart';
import 'package:namibia_plate/namibia_plate.dart';

void main() {
  test('town codes resolve', () {
    expect(NamibiaRegions.lookup('W'), 'Windhoek');
    expect(NamibiaRegions.lookup('WB'), 'Walvis Bay');
    expect(NamibiaRegions.lookup('a'), 'Arandis');
    expect(NamibiaRegions.lookup('AR'), 'Aranos');
  });

  test('empty and unlisted codes are null', () {
    expect(NamibiaRegions.lookup(''), isNull);
    expect(NamibiaRegions.lookup('Z'), isNull);
    expect(NamibiaRegions.lookup('SA'), isNull);
  });
}
