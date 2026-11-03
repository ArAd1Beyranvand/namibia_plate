import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:namibia_plate/namibia_plate.dart';

void main() => runApp(
  PlateExampleApp(
    spec: NamibiaPlates.diplomatic,
    theme: NamibiaThemes.standard,
  ),
);
