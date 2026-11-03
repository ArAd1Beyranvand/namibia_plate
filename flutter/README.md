FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Namibia to view examples:

https://platexample.ir/#/discover/namibia:flutter

# namibia_plate

Namibia's licence plates for the plate_core library — the yellow standard series, personalised, diplomatic and government plates.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/namibia_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/namibia:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/namibia_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/namibia:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/namibia_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/namibia:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/namibia_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/namibia:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  namibia_plate: ^0.1.0
```

### Use

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

## Specs

Each spec is one plate layout.

- `NamibiaPlates.standard`(…)
- `NamibiaPlates.personalised`(…)
- `NamibiaPlates.diplomatic` — id `na.diplomatic`
- `NamibiaPlates.government`(…)
- `NamibiaPlates.windhoek`
- `NamibiaPlates.sixTwoLetter`
- `NamibiaPlates.fiveDigit`
- `NamibiaPlates.fourDigitTwoLetter`
- `NamibiaPlates.personalisedSix`
- `NamibiaPlates.personalisedSeven`
- `NamibiaPlates.grn`
- `NamibiaPlates.police`
- `NamibiaPlates.nam1`

## Themes

- `NamibiaThemes.standard`
- `NamibiaThemes.personalised`
- `NamibiaThemes.diplomatic`
- `NamibiaThemes.government`

## Change it

`PlateCanvas` takes `spec:` (an entry of `NamibiaPlates`) and `theme:` (an entry of `NamibiaThemes`). Set `validator:` to `NamibiaTowns()` and `autoValidate: true` to show validation hints.

## Also included

- `NamibiaCountry` — the country panel.
- `NamibiaTowns` — the plate validator.
- `NamibiaRegions` — code table.

## Plates

The current designs. Colour lives on `NamibiaThemes`.

Only the post-independence series is implemented; the South West Africa
`S`-prefixed series (1968–1990) and the earlier unprefixed codes are not.
The presidential seal plate has no number and is not implemented.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/namibia_plate/blob/main/LICENSE).
