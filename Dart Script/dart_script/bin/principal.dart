import 'dart:io';
import 'dart:convert';
// ignore: Unused_import
import 'dart_script.dart';

List<App> appUrls(List<String> lista1) {
  late int i;
  late List<App> lista2;

  i = 0;
  lista2 = [];
  print(lista1.length);
  while (i < lista1.length) {
    lista2.add(App(lista1[i]));
    print(lista2[i].jsonRuta);
    i++;
  }
  return lista2;
}

List<List<dynamic>> appPages(List<App> lista2) {
  late int i;
  late List<List<dynamic>> lista3;

  i = 0;
  lista3 = [];
  while (i < lista2.length) {
    lista3.add(lista2[i].builder());
    i++;
  }
  return lista3;
}

void main() {
  // ignore: unused_local_variable
  late List<List<dynamic>> lista3;
  late List<String> lista1;
  late List<App> lista2;
  late String jsonUrls;

  // Esto lo mejorare con un Map o algo
  // Solo provisional
  jsonUrls =
      """C:\\Users\\Usuario\\Desktop\\Flutter\\Figma Json\\fitness.plugin.json""";
  lista1 = jsonUrls.split('\n');

  // Lista de Apps
  lista2 = appUrls(lista1);

  // Cada Indice es una App con sus Paginas Divididas
  // [[Pag0, ... , PagN], .... ,[Pag0, ... , PagN]]
  lista3 = appPages(lista2);
}

class App {
  String jsonRuta;

  App(this.jsonRuta) {
    // ignore: unnecessary_this
    this.jsonRuta = jsonRuta;
  }

  List<dynamic> builder() {
    final List<dynamic> paginas;
    final File jsonFile;
    final String jsonString;
    final dynamic jsonElement;
    Directory carpetaApp;
    Directory carpetaPagina;

    jsonFile = File(jsonRuta);
    jsonString = jsonFile.readAsStringSync();
    jsonElement = json.decode(jsonString);
    paginas = jsonElement['children'];
    carpetaApp = Directory('./${jsonElement['name']}');
    if (!carpetaApp.existsSync()) {
      // La carpeta no existe, así que la creamos
      carpetaApp.createSync();
      print('Carpeta ${jsonElement['name']} creada');
    }
    print(paginas.length);
    for (int i = 0; i < paginas.length; i++) {
      carpetaPagina =
          Directory('./${jsonElement['name']}/${paginas[i]['name']}');
      if (!carpetaPagina.existsSync()) {
        // La carpeta no existe, así que la creamos
        carpetaPagina.createSync();
        print('Carpeta ${paginas[i]['name']} creada');
      }
      secciones(paginas[i]);
    }
    // Con esto tengo una lista con las paginas de la app
    // Puedo acceder desde pagina[0,1....,n]
    // Lo que tendria seria el json entero de la pagina
    return paginas;
  }

// Ya la termino luego
  String seccion(List<dynamic> secciones) {
    return "hola";
  }

  void secciones(dynamic pagina) {
    final List<dynamic> secciones;
    int i;
    String parse1;
    String parse2;
    String paginaScript;
    String seccionScript;

    i = 0;
    parse1 = "";
    parse2 = "";
    // El JSON en la PAGE tendra un FRAME que hara de Pantalla con todas
    // las secciones dentro.
    // NOTA PARA DESPUES - LAS SECCIONES SON FRAMES Y LOS ROWS Y COLUMS GROUPS
    secciones = pagina['children']['children'];
    print(secciones.length);
    while (i < secciones.length) {
      if (secciones[i]['type'] == 'FRAME') {
        parse1 += """
        // ${secciones[i]['name']}
        seccion${i + 1}(contex),""";
        parse2 += """
        // ${secciones[i]['name']}
        List<Widget> seccion${i + 1}(BuildContext context) {
          return ${seccion(secciones[i])}
        }

        """;
      }
      i++;
    }
    seccionScript = """
import 'package:flutter/material.dart';
import 'package:flutter_application_1/funciones.dart';

$parse2
""";
    paginaScript = """
import 'package:flutter_application_1/funciones.dart';
import 'package:flutter_application_1/paginas/home_secreen/secciones_home.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Aqui se encuentra la estructura principal de la pantalla por secciones

    List<Widget> nucleo = 
    [
      $parse1
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
    """;
  }
}
