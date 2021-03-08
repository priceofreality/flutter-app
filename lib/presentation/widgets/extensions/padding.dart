import 'package:flutter/material.dart';

extension PaddingModifier on Widget {
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget paddingSymmetric(double vertical, double horizontal) => Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  Widget paddingOnly(
          double? left, double? bottom, double? right, double? top) =>
      Padding(
        padding: EdgeInsets.only(
            left: left ?? 0,
            bottom: bottom ?? 0,
            right: right ?? 0,
            top: top ?? 0),
        child: this,
      );
}
