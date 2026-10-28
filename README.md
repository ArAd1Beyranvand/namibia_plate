FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Namibia to view examples:

https://platexample.ir/#/discover/namibia

# namibia_plate

Namibia's licence plates for the `plate_core` library: the yellow standard series in every digit count and town-code length, personalised, diplomatic and government plates.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  namibia_plate: ^0.1.0
```

## Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:namibia_plate/namibia_plate.dart';

PlateCanvas(
  spec: NamibiaPlates.diplomatic,
  theme: NamibiaThemes.standard,
  validator: const NamibiaPlateValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Contains

- `NamibiaCountry` — country panel: `namibia`.
- `NamibiaPlates` — 13 plate specs: `diplomatic`, `windhoek`, `sixTwoLetter`, `fiveDigit`, `fourDigitTwoLetter`, `personalisedSix`, `personalisedSeven`, `grn`, `police`, `nam1`, `standard()`, `personalised()`, `government()`.
- `NamibiaThemes` — 4 themes: `standard`, `personalised`, `diplomatic`, `government`.
- `NamibiaPlateValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `NamibiaCompleteValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `NamibiaRegions` — code table.

## Plates

The current designs. Colour lives on `NamibiaThemes`.

Only the post-independence series is implemented; the South West Africa
`S`-prefixed series (1968–1990) and the earlier unprefixed codes are not.
The presidential seal plate has no number and is not implemented.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

