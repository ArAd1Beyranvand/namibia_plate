import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

/// The Namibian alphabets, defined in `plate_alphabet`. Digits are Western on
/// every plate.
abstract final class NamibiaAlphabets {
  static const PlateAlphabet digits = PlateAlphabetDigits.english;
  static const PlateAlphabet region = PlateAlphabetNamibia.region;
  static const PlateAlphabet personalised = PlateAlphabetNamibia.personalised;
}
