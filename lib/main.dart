import 'package:flutter/material.dart';
import 'package:flutter_codecheck/Pages/search_page.dart';
import 'package:flutter_codecheck/Providers/color_theme_provider.dart';
import 'package:flutter_codecheck/Theme/color_schemes.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      themeMode: ref.watch(colorThemeProvider) == true
          ? ThemeMode.light
          : ThemeMode.dark,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
      //言語設定でデバックしたいときは下記を設定する。
      //locale: const Locale('en'),
      home: SearchPage(),
    );
  }
}
