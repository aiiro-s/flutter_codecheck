import 'package:flutter/material.dart';
import 'package:flutter_codecheck/Pages/search_page.dart';
import 'package:flutter_codecheck/Providers/color_theme_provider.dart';
import 'package:flutter_codecheck/Theme/color_schemes.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      home: SearchPage(),
    );
  }
}
