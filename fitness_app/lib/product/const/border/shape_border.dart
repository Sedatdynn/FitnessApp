import 'package:flutter/material.dart';

import 'border_radi.dart';

class ShapedBorders {
  /// Low rounded rectangle shaped border. Radius: 12.
  static const RoundedRectangleBorder roundedLow =
      RoundedRectangleBorder(borderRadius: BorderRadi.lowCircular);

  /// Low-Medium rounded rectangle shaped border. Radius: 16.
  static const RoundedRectangleBorder roundedLowMed =
      RoundedRectangleBorder(borderRadius: BorderRadi.midCircular);

  /// Medium rounded rectangle shaped border. Radius: 18.
}
