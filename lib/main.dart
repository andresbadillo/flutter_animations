import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/pages/launcher_page.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeChanger(2),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage(),
      theme: currentTheme,
    );
  }
}
