FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Namibia to view examples:

https://platexample.ir/#/discover/namibia:python

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

### Install (Python)

Copy `python/plates/countries/namibia/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.namibia.data import SPECS, THEMES

spec = SPECS["na.diplomatic"]
theme = THEMES["NamibiaThemes.standard"]
print(spec.id)
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

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `NamibiaPlateValidator`, `NamibiaCompleteValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/namibia_plate/blob/main/LICENSE).
