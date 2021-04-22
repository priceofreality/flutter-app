import 'package:flutter/material.dart';

enum OptionGroupIcons { Tv, Smartphone, Laptop }

extension OptionGroupIconsModifier on OptionGroupIcons {
  Icon get icon {
    switch (this) {
      case OptionGroupIcons.Tv:
        return Icon(Icons.tv);
      case OptionGroupIcons.Smartphone:
        return Icon(Icons.smartphone);
      case OptionGroupIcons.Laptop:
        return Icon(Icons.laptop);
    }
  }
}
