// import 'dart:io';
// import 'dart:convert';
//import 'package:flutter/material.dart';

//List<Widget> divideEnPaginas(dynamic jsonElement) {
// Lógica para construir el árbol de widgets desde el JSON
// ...

// return <Widget>[]; // Reemplaza con el árbol de widgets construido
//}

// Real de como convertir json a arbol de widgets en string

abstract class Element {
  late String type;
  late String color;
  late double width;
  late double height;
  List<Element>? children;

  Element.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    color = json['color'];
    width = json['width'].toDouble();
    height = json['height'].toDouble();

    if (json['children'] != null) {
      children = List<Element>.from(
          json['children'].map((childJson) => createElement(childJson)));
    }
  }

  String toWidgetString();

  static Element createElement(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'Frame':
        return Frame.fromJson(json);
      case 'Text':
        return TextElement.fromJson(json);
      case 'Vector':
        return Vector.fromJson(json);
      case 'Image':
        return ImageElement.fromJson(json);
      // Se Puede agregar más casos según sea necesario
      default:
        throw ArgumentError('Tipo de elemento desconocido: ${json['type']}');
    }
  }
}

class Frame extends Element {
  Frame.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @override
  String toWidgetString() {
    if (children != null && children!.isNotEmpty) {
      final childrenString =
          children!.map((child) => child.toWidgetString()).join(',\n');
      return 'Container(\n'
          '  width: $width,\n'
          '  height: $height,\n'
          '  color: getColorFromString("$color"),\n'
          '  child: Column(\n'
          '    children: [\n'
          '      $childrenString\n'
          '    ],\n'
          '  ),\n'
          ')';
    } else {
      return 'Container(\n'
          '  width: $width,\n'
          '  height: $height,\n'
          '  color: getColorFromString("$color"),\n'
          ')';
    }
  }
}

class TextElement extends Element {
  late String text;

  TextElement.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    text = json['text'];
  }

  @override
  String toWidgetString() {
    return 'Text(\n'
        '  "$text",\n'
        '  style: TextStyle(\n'
        '    color: getColorFromString("$color"),\n'
        '  ),\n'
        ')';
  }
}

class Vector extends Element {
  Vector.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @override
  String toWidgetString() {
    return 'CustomPaint(\n'
        '  painter: VectorPainter(vectorData: ${children![0].toWidgetString()}),\n'
        ')';
  }
}

class ImageElement extends Element {
  ImageElement.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @override
  String toWidgetString() {
    return 'Image.asset(\n'
        '  "$color",\n'
        ')';
  }
}

void main() {
  // Ejemplo de JSON con varios tipos de elementos
  // Esto no es real.
  // Ademas que aqui se simula un JSON, uno original
  // tendira que estar en un decodeJson(json)
  Map<String, dynamic> jsonData = {
    "elements": [
      {
        "type": "Frame",
        "color": "red",
        "width": 100,
        "height": 50,
        "children": [
          {
            "type": "Text",
            "color": "blue",
            "width": 50,
            "height": 25,
            "text": "Hello"
          },
          {
            "type": "Vector",
            "color": "green",
            "width": 50,
            "height": 25,
            "children": [
              {"type": "Frame", "color": "yellow", "width": 30, "height": 15}
            ]
          }
        ]
      },
      {"type": "Image", "color": "path/to/image.png", "width": 80, "height": 40}
    ]
  };

  // Convertir JSON a lista de Element
  List<Element> elements = List<Element>.from(jsonData['elements']
      .map((elementJson) => Element.createElement(elementJson)));

  // Convertir lista de Element a lista de Widgets
  final List<String> widgetTreeStrings =
      elements.map((element) => element.toWidgetString()).toList();

  // Imprimir la cadena de texto
  // widgetTreeStrings.forEach(print);

  String seccion1;
  String parse;
  int i;

  i = 0;
  parse = "";
  while (i < widgetTreeStrings.length) {
    i < (widgetTreeStrings.length - 1)
        ? parse += "${widgetTreeStrings[i]},\n"
        : parse += "${widgetTreeStrings[i]}\n";
    i++;
  }
  seccion1 = """
  [
    $parse
  ]
  """;
  print(elements[0].type);
}


// Lo que puedo hacer es como lo que tengo es una Lista con los strings
// y al fianal eso no me vale para cuando lo sobrescriba en el archivo.dart
// Puedo hacer es tener una variable tal que:
// String lista = """"
// [  
// ]
// """
// Y lo que haga es que con un control de flujo de iteracion tipo for loop
// o while meta cada uno de los Strings que son arboles de Widgets convertidos;
// del List<String> dentro de los [  $.{ } ] para asi tener en String una lista
// de los Widgets.
// Tendria que quedar tal que:

/*
Tenemos el List<String> final que seria 
[ "Widget Tree1", "Widget Tree2", ... , "Widget TreeN"]

Al final deberiamos lograr convertirlo tal que: 

String lista = """"
 [  
  Widget Tree1,
  Widget Tree2,
       ....
  Widget TreeN
]
 """

Esto prodria ser o bien cada seccion o facilmente una pagina entera.

Si fuera Secciones habria luego que hacer el rejunte de todas para ya si 
pasarlo al creador de archivo.dart.

Lo que habria que hacer seria tal que asi:

Tenemos una seccion como ya se preparo antes, tal que: 

String lista = """"
 [  
  Widget Tree1,
  Widget Tree2,
       ....
  Widget TreeN
]
 """

Ahora se pasaria a llamar String lista -> String seccion1 .

Luego se tendria que preparar el script de las distintas secciones tal que:


Digamos que nosotros de una pagina hemos generado tres secciones tal que: 

String seccion1 = """"
 [  
  Widget Tree1,
  Widget Tree2,
       ....
  Widget TreeN
]
 """
String seccion2 = """"
 [  
  Widget Tree1,
  Widget Tree2,
       ....
  Widget TreeN
]
 """
String seccion3 = """"
 [  
  Widget Tree1,
  Widget Tree2,
       ....
  Widget TreeN
]
 """

Lo que haremos es crear una variable tal que:


String secciones = """

import 'package:flutter/material.dart';
import 'package:flutter_application_1/funciones.dart';

List<Widget> seccion1(BuildContext context) {
  return $.seccion1 , 
  }

List<Widget> seccion2(BuildContext context) {
  return $.seccion2 , 
  }


List<Widget> seccion3(BuildContext context) {
  return $.seccion3 , 
  }
"""

Esto hay que hacerlo automatizado para que en funcion del numero de secciones 
que haya cree o incorpore en String secciones  cada modulo de seccion:

List<Widget> seccionN(BuildContext context) {
  return $.seccionN , 
  }
"""

*/
