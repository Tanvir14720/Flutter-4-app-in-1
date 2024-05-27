import 'package:flutter/material.dart';
// import 'package:folio/configs/configs.dart';
// import 'package:folio/constants.dart';
// import 'package:folio/provider/app_provider.dart';
// import 'package:folio/responsive/responsive.dart';
// import 'package:folio/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Portfolio/configs/app_dimensions.dart';
import 'package:weather_app/Portfolio/configs/app_theme.dart';
import 'package:weather_app/Portfolio/configs/space.dart';
import 'package:weather_app/Portfolio/constants.dart';
import 'package:weather_app/Portfolio/provider/app_provider.dart';
import 'package:weather_app/Portfolio/responsive/responsive.dart';
import 'package:weather_app/Portfolio/utils/utils.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Wrap(
      runSpacing: AppDimensions.normalize(10),
      alignment: WrapAlignment.center,
      children: StaticUtils.socialIconURL
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding:
                  Responsive.isMobile(context) ? Space.all(0.2, 0) : Space.h!,
              child: IconButton(
                highlightColor: Colors.white54,
                splashRadius: AppDimensions.normalize(12),
                icon: Image.network(
                  e.value,
                  color: appProvider.isDark ? Colors.white : Colors.black,
                  height: Responsive.isMobile(context)
                      ? AppDimensions.normalize(10)
                      : null,
                ),
                iconSize: Responsive.isMobile(context)
                    ? AppDimensions.normalize(10)
                    : AppDimensions.normalize(15),
                onPressed: () => openURL(
                  StaticUtils.socialLinks[e.key],
                ),
                hoverColor: AppTheme.c!.primary!,
              ),
            ),
          )
          .toList(),
    );
  }
}
