import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'dart_script.dart';

void main() {
  // Lee el contenido del primer archivo JSON
  App app1 = App('ruta/al/archivo1.json');
  print(app1);

  // Lee el contenido del primer archivo JSON
  App app2 = App('ruta/al/archivo2.json');
  print(app2);

  // Puedes hacer lo que quieras con los widgetTrees, como renderizarlos en tu aplicación Flutter
}

class App {
  String jsonRuta;

  App(this.jsonRuta) {
    jsonRuta = jsonRuta;
  }

  List<Widget> builder() {
    final jsonFile1 = File(jsonRuta);
    final jsonString1 = jsonFile1.readAsStringSync();
    final dynamic jsonElement1 = json.decode(jsonString1);
    final List<Widget> pagina = divideEnPaginas(jsonElement1);

    // Con esto tengo una lista con las paginas de la app
    // Puedo acceder desde pagina[0,1....,n] 
    // Lo que tendria seria el json entero de la pagina
    return pagina;
  }
}




/*
Primero se tienen las Aplicaciones de manera que se encuentran las aplicaciones 
que hay.
  - Esto supone que se leeran distintas url de distintos json
  - Cada json es una aplicacion con sus paginas

  Se tomara la url y se descodifica el json.
  Luego se pasara el json a un funcion para que se divida en Pagina
  Teniendo cada Pagina de la App separadas en json se procede a pasar cada una
  a otra funcion de separacion por Secciones.
  Cada Seccion se pasara por una funcion para convertila en una lista 
  de Widgets.

  Se tendra por tanto variables de cada seccion de tipo List<Widget>
  Luego se ha de crear una funcion que cree un archivo con las listas
  de secciones.
  Luego Se ha de crear otra funcion que cree un archivo de la pagina

  Al final se tendra en la App   archivo de cada Pagina y su correspondientes
  Secciones.





Luego se ha de hacer filtro para Paginas de manera que cada pagina tenga su 
propio documento guardado.

Luego cada pagina tendra sus secciones

Cada seccion tendra su lista de Widgets

Se podria hacer mas modular y separar lo widgets hijos de los Widgets Padres
*/

/*
Hay una parte que es recibir el json.

Hay otra parte que es grabar en un documento .dart con su directorio
el contenido que se quiere.
*/


