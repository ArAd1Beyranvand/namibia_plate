/// Namibia's licence plates for the `plate_core` library: the yellow standard
/// series in every digit count and town-code length, personalised, diplomatic
/// and government plates.
library;

// TODO(py): [D5] one module `plates.countries.namibia`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/namibia`; tree-shakable.
// TODO(kt): [D5] package `countries.namibia` in the countries module.
export 'src/namibia_alphabets.dart';
export 'src/namibia_colors.dart';
export 'src/namibia_country.dart';
export 'src/namibia_plates.dart';
export 'src/namibia_themes.dart';
export 'src/namibia_regions.dart';
export 'src/namibia_validators.dart';
