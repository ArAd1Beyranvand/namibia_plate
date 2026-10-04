import 'package:plate_core/plate_core.dart';

/// The town codes, from the article's list (which it says may be incomplete).
abstract final class NamibiaTowns {
  static const Map<String, String> all = <String, String>{
    'A': 'Arandis', 'AR': 'Aranos', 'B': 'Bethanien', 'BK': 'Bukalo', //
    'DV': 'Divundu', 'EN': 'Eenhana', 'G': 'Grootfontein', 'GO': 'Gobabis',
    'HB': 'Henties Bay', 'HN': 'Helao Nafidi', 'K': 'Keetmanshoop',
    'KA': 'Karasburg', 'KH': 'Khorixas', 'KM': 'Katima Mulilo',
    'KR': 'Karibib', 'KO': 'Okongo', 'L': 'Lüderitz', 'M': 'Mariental',
    'MA': 'Maltahöhe', 'MT': 'Omuthiya', 'ND': 'Ondangwa', 'NK': 'Nkurenkuru',
    'OA': 'Okahao', 'OH': 'Okahandja', 'OJ': 'Outjo', 'OK': 'Okakarara',
    'OM': 'Omaruru', 'ON': 'Otjinene', 'OP': 'Opuwo', 'OR': 'Oranjemund',
    'OT': 'Otjiwarongo', 'OV': 'Otavi', 'R': 'Rehoboth', 'RC': 'Ruacana',
    'RU': 'Rundu', 'S': 'Swakopmund', 'SH': 'Oshakati', 'T': 'Tsumeb',
    'TK': 'Tsumkwe', 'U': 'Usakos', 'UP': 'Outapi', 'W': 'Windhoek',
    'WB': 'Walvis Bay',
  };

  static String? name(String code) => all[code];
}

/// A standard plate: every slot filled and the town code on the list.
/// Gated on the town code, which is typed last.
class NamibiaPlateValidator extends GatedPlateValidator {
  const NamibiaPlateValidator();

  @override
  String get gateGroup => 'region';

  @override
  PlateValidation judge(PlateEntry entry) {
    final incomplete = _incomplete(entry);
    if (incomplete != null) return incomplete;
    if (NamibiaTowns.name(entry.group('region')) == null) {
      return const PlateValidation.invalid('Unknown town code.');
    }
    return const PlateValidation.valid();
  }
}

/// Personalised, diplomatic and government plates: every slot filled.
class NamibiaCompleteValidator extends PlateValidator {
  const NamibiaCompleteValidator();

  @override
  PlateValidation validate(PlateEntry entry) =>
      restrictionVerdict(entry) ??
      _incomplete(entry) ??
      const PlateValidation.valid();
}

PlateValidation? _incomplete(PlateEntry entry) {
  for (final g in entry.spec.textGroups) {
    final key = g.key;
    if (key == null) continue;
    if (entry.group(key).length != g.indices.length) {
      return PlateValidation.invalid('The $key is incomplete.');
    }
  }
  return null;
}
