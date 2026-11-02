"""Port of namibia_plate/lib/src/namibia_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, restriction_verdict

_TOWNS = {
    "A": "Arandis",
    "AR": "Aranos",
    "B": "Bethanien",
    "BK": "Bukalo",
    "DV": "Divundu",
    "EN": "Eenhana",
    "G": "Grootfontein",
    "GO": "Gobabis",
    "HB": "Henties Bay",
    "HN": "Helao Nafidi",
    "K": "Keetmanshoop",
    "KA": "Karasburg",
    "KH": "Khorixas",
    "KM": "Katima Mulilo",
    "KR": "Karibib",
    "KO": "Okongo",
    "L": "Lüderitz",
    "M": "Mariental",
    "MA": "Maltahöhe",
    "MT": "Omuthiya",
    "ND": "Ondangwa",
    "NK": "Nkurenkuru",
    "OA": "Okahao",
    "OH": "Okahandja",
    "OJ": "Outjo",
    "OK": "Okakarara",
    "OM": "Omaruru",
    "ON": "Otjinene",
    "OP": "Opuwo",
    "OR": "Oranjemund",
    "OT": "Otjiwarongo",
    "OV": "Otavi",
    "R": "Rehoboth",
    "RC": "Ruacana",
    "RU": "Rundu",
    "S": "Swakopmund",
    "SH": "Oshakati",
    "T": "Tsumeb",
    "TK": "Tsumkwe",
    "U": "Usakos",
    "UP": "Outapi",
    "W": "Windhoek",
    "WB": "Walvis Bay",
}


class NamibiaTowns:
    all = _TOWNS

    @staticmethod
    def name(code):
        return _TOWNS.get(code)


def _incomplete(entry):
    for g in entry.spec.text_groups:
        if g.key is None:
            continue
        if len(entry.group(g.key)) != sum(entry.spec.slots[i].length for i in g.indices):
            return PlateValidation.invalid(f"The {g.key} is incomplete.")
    return None


class NamibiaPlateValidator(GatedPlateValidator):
    gate_group = "region"

    def judge(self, entry: PlateEntry) -> PlateValidation:
        incomplete = _incomplete(entry)
        if incomplete is not None:
            return incomplete
        if NamibiaTowns.name(entry.group("region")) is None:
            return PlateValidation.invalid("Unknown town code.")
        return PlateValidation.valid()


class NamibiaCompleteValidator:
    def validate(self, entry: PlateEntry) -> PlateValidation:
        return restriction_verdict(entry) or _incomplete(entry) or PlateValidation.valid()
