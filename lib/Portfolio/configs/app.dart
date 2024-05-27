import 'package:flutter/material.dart';
// import 'package:folio/configs/configs.dart';
import 'package:weather_app/Portfolio/configs/app_dimensions.dart';
import 'package:weather_app/Portfolio/configs/app_theme.dart';
import 'package:weather_app/Portfolio/configs/app_typography.dart';
import 'package:weather_app/Portfolio/configs/space.dart';
import 'package:weather_app/Portfolio/configs/ui.dart';
import 'package:weather_app/Portfolio/configs/ui_props.dart';

class App {
  static bool? isLtr;
  static bool showAds = false;

  static init(BuildContext context) {
    UI.init(context);
    AppDimensions.init();
    AppTheme.init(context);
    UIProps.init();
    Space.init();
    AppText.init();
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }
}
