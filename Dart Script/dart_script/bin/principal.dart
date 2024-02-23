import 'dart:io';
import 'dart:convert';
import 'dart_script.dart';

// FUNCIONES BASICAS
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

// CLASE PRINCIPAL
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
    final Map<String, dynamic> jsonElement;
    List<String> filenames;
    List<String> contents;
    String script1;
    // String script2;

    jsonFile = File(jsonRuta);
    jsonString = jsonFile.readAsStringSync();
    jsonElement = json.decode(jsonString);
    paginas = jsonElement['children'];
    filenames = [];
    script1 = '';
    print(paginas.length);
    for (int i = 0; i < paginas.length; i++) {
      filenames.add(
          '${jsonElement['name']}/${paginas[i]['name']}/${paginas[i]['name']}.dart');
      filenames.add(
          '${jsonElement['name']}/${paginas[i]['name']}/secciones_${paginas[i]['name']}.dart');
      script1 = 'secciones_${paginas[i]['name']}.dart';
      // script2 = '${paginas[i]['name']}.dart';
      contents = secciones(paginas[i], script1);
      createFilesRecursively(filenames, contents);
    }
    // Con esto tengo una lista con las paginas de la app
    // Puedo acceder desde pagina[0,1....,n]
    // Lo que tendria seria el json entero de la pagina
    return paginas;
  }

  List<String> secciones(Map<String, dynamic> pagina, String script1) {
    List<String> contents;
    List<dynamic> secciones;
    int i;
    String parse1;
    String parse2;
    String paginaScript;
    String seccionScript;

    i = 0;
    parse1 = "";
    parse2 = "";
    contents = [];
    // [seccion0, ... , seccionN]
    secciones = pagina['children'];

    // El JSON en la PAGE tendra un FRAME que hara de Pantalla con todas
    // las secciones dentro.
    // NOTA PARA DESPUES - LAS SECCIONES SON FRAMES Y LOS ROWS Y COLUMS GROUPS
    // LOS CONTAINERS SON FRAMES

    print(secciones.length);
    while (i < secciones.length) {
      if (secciones[i]['type'] == 'FRAME') {
        print(secciones[i]['name']);
        parse1 += """
        // ${secciones[i]['name']}
        seccion${i + 1}(context),
        """;
        parse2 += """
        // ${secciones[i]['name']}
        List<Widget> seccion${i + 1}(BuildContext context) {
          return ${seccion(secciones[i])} ;
        }
        """;
      }
      i++;
    }
    seccionScript = """
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/funciones.dart';

$parse2
""";
    paginaScript = """
// import 'package:flutter_application_1/funciones.dart';
import '$script1';
import 'package:flutter/material.dart';


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
            // ignore: undefined_method
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
    contents.add(paginaScript);
    contents.add(seccionScript);
    return contents;
  }

  void createFilesRecursively(List<String> filenames, List<String> contents) {
    for (int i = 0; i < filenames.length; i++) {
      String filename = filenames[i];
      String content = contents[i];

      // Obtener el directorio padre del archivo
      String parentDirectory = Directory(filename).parent.path;

      // Crear el directorio padre si no existe
      Directory(parentDirectory).createSync(recursive: true);

      // Crear el archivo y escribir el contenido
      File file = File(filename);
      file.writeAsStringSync(content);
    }
  }
}
