import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRadialProgress(
                  porcentaje: porcentaje,
                  color: Colors.blue,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje * 1.2,
                  color: Colors.purple,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRadialProgress(
                  porcentaje: porcentaje * 1.4,
                  color: Colors.amber,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje * 1.6,
                  color: Colors.pink,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;

  const CustomRadialProgress({
    Key? key,
    required this.porcentaje,
    required this.color,
  }) : super(key: key);

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: appTheme.textTheme.bodyText1!.color ?? Colors.blueGrey,
        grosorPrimario: 8.0,
        grosorSecundario: 2.0,
      ),
    );
  }
}
