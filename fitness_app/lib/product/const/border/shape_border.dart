import 'package:flutter/material.dart';

import 'border_radi.dart';

@immutable
final class ShapedBorders extends RoundedRectangleBorder {
  /// Low rounded rectangle shaped border. Radius: 12.

  const ShapedBorders.roundedLow() : super(borderRadius: BorderRadi.lowCircular);

  /// Low-Medium rounded rectangle shaped border. Radius: 16.

  const ShapedBorders.roundedMedium() : super(borderRadius: BorderRadi.midCircular);
}
