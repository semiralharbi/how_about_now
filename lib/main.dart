import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:how_about_now/firebase_options.dart';
import 'package:how_about_now/injectable/injectable.dart';
import 'package:how_about_now/presentation/theme/theme_manager.dart';
import 'package:how_about_now/presentation/utils/router/app_router.dart';
import 'package:how_about_now/presentation/utils/translation/generated/l10n.dart';

void main() async {
  await _configureSystemUIOverlays();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HowAboutNowApp());
}

Future<void> _configureSystemUIOverlays() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class HowAboutNowApp extends StatelessWidget {
  const HowAboutNowApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: getIt<AppRouter>().config(),
        localizationsDelegates: const [
          Translation.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'EN'),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale == null) return supportedLocales.first;

          return supportedLocales.firstWhere(
            (e) => e.languageCode == locale.languageCode && e.countryCode == locale.countryCode,
            orElse: () => supportedLocales.firstWhere(
              (c) => c.languageCode == locale.languageCode,
              orElse: () => supportedLocales.first,
            ),
          );
        },
        theme: getIt<ThemeManager>().getTheme(),
      );
}
