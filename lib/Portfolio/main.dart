import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:weather_app/Portfolio/provider/app_provider.dart';
import 'package:weather_app/Portfolio/provider/drawer_provider.dart';
import 'package:weather_app/Portfolio/provider/scroll_provider.dart';
import 'package:weather_app/Portfolio/sections/main/main_section.dart';
import 'package:weather_app/Portfolio/configs/core_theme.dart' as theme;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<PortfolioApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
      ],
      child: Consumer<AppProvider>(
        builder: (context, value, _) => MaterialChild(
          provider: value,
        ),
      ),
    );
  }
}

class MaterialChild extends StatefulWidget {
  final AppProvider provider;
  const MaterialChild({Key? key, required this.provider}) : super(key: key);

  @override
  State<MaterialChild> createState() => _MaterialChildState();
}

class _MaterialChildState extends State<MaterialChild> {
  void initAppTheme() {
    final appProviders = Provider.of<AppProvider>(context, listen: false);
    appProviders.init();
  }

  @override
  void initState() {
    initAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MD. MASHRUR TANVIR NASIF',
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      themeMode: widget.provider.themeMode,
      initialRoute: "/",
      routes: {
        "/": (context) => const MainPage(),
      },
    );
  }
}
