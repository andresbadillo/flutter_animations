import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import '../widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Scaffold(
      body: HeaderWaves(color: accentColor),
      // body: HeaderWavesGradient(),
    );
  }
}
