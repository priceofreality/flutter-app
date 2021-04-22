import 'package:flutter/material.dart';

enum OptionGroupIcons { Tv, Smartphone, Laptop, Vehicle }

extension OptionGroupIconsModifier on OptionGroupIcons {
  Icon get icon {
    switch (this) {
      case OptionGroupIcons.Tv:
        return Icon(Icons.tv);
      case OptionGroupIcons.Smartphone:
        return Icon(Icons.smartphone);
      case OptionGroupIcons.Laptop:
        return Icon(Icons.laptop);
      case OptionGroupIcons.Vehicle:
        return Icon(Icons.directions_car);
    }
  }
}
