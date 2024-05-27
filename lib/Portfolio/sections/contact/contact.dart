import 'package:flutter/material.dart';
// import 'package:folio/responsive/responsive.dart';
// import 'package:folio/sections/contact/contact_desktop.dart';
// import 'package:folio/sections/contact/contact_mobile.dart';
import 'package:weather_app/Portfolio/responsive/responsive.dart';
import 'package:weather_app/Portfolio/sections/contact/contact_desktop.dart';
import 'package:weather_app/Portfolio/sections/contact/contact_mobile.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContactMobileTab(),
      tablet: ContactMobileTab(),
      desktop: ContactDesktop(),
    );
  }
}
