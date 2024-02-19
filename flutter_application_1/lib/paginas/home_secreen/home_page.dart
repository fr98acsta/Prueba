import 'package:flutter/material.dart';
import 'package:flutter_application_1/funciones.dart';
import 'package:flutter_application_1/paginas/home_secreen/secciones_home.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Aqui se encuentra la estructura principal de la pantalla por secciones

    List<Widget> nucleo = [
      // Header
      seccion1(context),
      // Search & Tags
      seccion2(context),
      // Main Workout
      seccion3(context),
      //Categories Workouts
      seccion4(context)
    ].expand<Widget>((x) => x).toList();

    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: doResponsive(1000, context),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Stack(
              // Aqui sepondra el children: nucleo que tendra todas las secciones
              children: nucleo,
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
