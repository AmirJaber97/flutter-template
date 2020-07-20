import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:project_template/app/locator.dart';
import 'package:project_template/caches/preferences.dart';
import 'package:project_template/providers/lang_provider.dart';
import 'package:project_template/providers/theme_provider.dart';
import 'package:project_template/services/connection_status.dart';
import 'package:project_template/ui/template.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init logger
  Logger.level = Level.info;
  // init locator (DI)
  setupLocator();
  // init hive (cache)
  await Hive.initFlutter();
  await locator<Preferences>().openBox();
  // init connection stream
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  // ensure orientation is portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // wrap app with provider then run
  runApp(_setupProvider());
}

Widget _setupProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider<LanguageProvider>(
        create: (context) => LanguageProvider(),
      ),
    ],
    child: Template(),
  );
}
