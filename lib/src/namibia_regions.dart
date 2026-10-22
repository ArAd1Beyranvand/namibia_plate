/// Locates a Namibian plate from its trailing town code.
///
/// Source: the "Town codes" list of
/// https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Namibia
/// (the article notes the list may be incomplete).
abstract final class NamibiaRegions {
  static const Map<String, String> _towns = <String, String>{
    'A': 'Arandis',
    'AR': 'Aranos',
    'B': 'Bethanie',
    'BK': 'Bukalo',
    'DV': 'Divundu',
    'EN': 'Eenhana',
    'G': 'Grootfontein',
    'GO': 'Gobabis',
    'HB': 'Henties Bay',
    'HN': 'Helao Nafidi',
    'K': 'Keetmanshoop',
    'KA': 'Karasburg',
    'KH': 'Khorixas',
    'KM': 'Katima Mulilo',
    'KR': 'Karibib',
    'KO': 'Okongo',
    'L': 'Lüderitz',
    'M': 'Mariental',
    'MA': 'Maltahöhe',
    'MT': 'Omuthiya',
    'ND': 'Ondangwa',
    'NK': 'Nkurenkuru',
    'OA': 'Okahao',
    'OH': 'Okahandja',
    'OJ': 'Outjo',
    'OK': 'Okakarara',
    'OM': 'Omaruru',
    'ON': 'Otjinene',
    'OP': 'Opuwo',
    'OR': 'Oranjemund',
    'OT': 'Otjiwarongo',
    'OV': 'Otavi',
    'R': 'Rehoboth',
    'RC': 'Ruacana',
    'RU': 'Rundu',
    'S': 'Swakopmund',
    'SH': 'Oshakati',
    'T': 'Tsumeb',
    'TK': 'Tsumkwe',
    'U': 'Usakos',
    'UP': 'Outapi',
    'W': 'Windhoek',
    'WB': 'Walvis Bay',
  };

  /// The town of [code], or null when empty or unlisted.
  static String? lookup(String code) => _towns[code.toUpperCase()];

  static String? captionOf(String Function(String key) group) => lookup(group('region'));
}
