import 'package:provider/provider.dart';

import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:weather_app/Portfolio/animations/entrance_fader.dart';
// import 'package:folio/constants.dart';
// import 'package:folio/widget/arrow_on_top.dart';
import 'package:weather_app/Portfolio/configs/app.dart';
import 'package:weather_app/Portfolio/configs/app_dimensions.dart';
import 'package:weather_app/Portfolio/configs/app_theme.dart';
import 'package:weather_app/Portfolio/configs/app_typography.dart';
import 'package:weather_app/Portfolio/configs/space.dart';
import 'package:weather_app/Portfolio/constants.dart';
import 'package:weather_app/Portfolio/provider/app_provider.dart';
import 'package:weather_app/Portfolio/provider/drawer_provider.dart';
import 'package:weather_app/Portfolio/provider/scroll_provider.dart';
import 'package:weather_app/Portfolio/responsive/responsive.dart';
import 'package:weather_app/Portfolio/utils/navbar_utils.dart';
import 'package:weather_app/Portfolio/utils/utils.dart';
import 'package:weather_app/Portfolio/widget/arrow_on_top.dart';
import 'package:weather_app/Portfolio/widget/navbar_actions_button.dart';
import 'package:weather_app/Portfolio/widget/navbar_logo.dart';

part 'widgets/_navbar_desktop.dart';
part 'widgets/_mobile_drawer.dart';
part 'widgets/_body.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      drawer: !Responsive.isDesktop(context) ? const _MobileDrawer() : null,
      body: SafeArea(
        child: Stack(
          children: [
            const _Body(),
            const ArrowOnTop(),
            Responsive.isTablet(context) || Responsive.isMobile(context)
                ? const _NavBarTablet()
                : const _NavbarDesktop(),
          ],
        ),
      ),
    );
  }
}
