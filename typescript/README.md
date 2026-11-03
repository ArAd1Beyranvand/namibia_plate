FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Namibia to view examples:

https://platexample.ir/#/discover/namibia:typescript

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

### Install (TypeScript)

Copy `typescript/src/countries/namibia/` into `plate_core/typescript/src/countries/`.

Then run the tests from `plate_core/typescript/`: `npm test`.

### Use

```ts
import country from './countries/namibia';

const spec = country.specs.get('na.diplomatic');
console.log(country.package);
```

## Specs

The specs are the same in every language (they come from shared data).

- `na.diplomatic`
- `na.standard.6.1`
- `na.standard.6.2`
- `na.standard.5.1`
- `na.standard.4.2`
- `na.personalised.6`
- `na.personalised.7`
- `na.government.grn.5`
- `na.government.pol.4`
- `na.government.nam1.4`

## Themes

- `NamibiaThemes.standard`
- `NamibiaThemes.personalised`
- `NamibiaThemes.diplomatic`
- `NamibiaThemes.government`

## Change it

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`NamibiaPlateValidator`, `NamibiaCompleteValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/namibia_plate/blob/main/LICENSE).
