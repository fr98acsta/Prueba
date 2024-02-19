// import 'dart:convert';
// import 'package:flutter/material.dart';

// class Frame {
//   late String color;
//   late double width;
//   late double height;
//   List<Frame>? children;

//   Frame.fromJson(Map<String, dynamic> json) {
//     color = json['color'];
//     width = json['width'].toDouble();
//     height = json['height'].toDouble();

//     if (json['children'] != null) {
//       children = List<Frame>.from(
//           json['children'].map((childJson) => Frame.fromJson(childJson)));
//     }
//   }

//   Widget toWidget() {
//     if (children != null && children!.isNotEmpty) {
//       return Container(
//         width: width,
//         height: height,
//         color: _getColorFromString(color),
//         child: Column(
//           children: children!.map((child) => child.toWidget()).toList(),
//         ),
//       );
//     } else {
//       return Container(
//         width: width,
//         height: height,
//         color: _getColorFromString(color),
//       );
//     }
//   }

//   Color _getColorFromString(String colorString) {
//     // Implementa la lógica para convertir el color de cadena a Color
//     // En este ejemplo, simplemente estamos usando Colors.black como valor predeterminado
//     return Colors.black;
//   }
// }

// void main() {
//   // Ejemplo de JSON
//   Map<String, dynamic> jsonData = {
//     "frames": [
//       {
//         "color": "red",
//         "width": 100,
//         "height": 50,
//         "children": [
//           {"color": "blue", "width": 50, "height": 25},
//           {"color": "green", "width": 50, "height": 25}
//         ]
//       },
//       {"color": "yellow", "width": 80, "height": 40}
//     ]
//   };

//   // Convertir JSON a lista de Frame
//   List<Frame> frames = List<Frame>.from(
//       jsonData['frames'].map((frameJson) => Frame.fromJson(frameJson)));

//   // Convertir lista de Frame a lista de Widgets
//   List<Widget> widgetTree = frames.map((frame) => frame.toWidget()).toList();

//   // Convertir la lista de Widgets a una cadena de texto
//   String widgetTreeString = widgetTree.toString();

//   // Imprimir la cadena de texto
//   print(widgetTreeString);
// }

import 'package:flutter/material.dart';

void main() {
  generateWidgetCode();
}

void generateWidgetCode() {
  final List<Widget> widgets = buildWidgetTreeList([
    {
      "type": "RECTANGLE",
      "width": 100,
      "height": 50,
      "color": "red",
      "children": [
        {
          "type": "RECTANGLE",
          "width": 50,
          "height": 25,
          "color": "blue",
        },
        {
          "type": "RECTANGLE",
          "width": 50,
          "height": 25,
          "color": "green",
        }
      ]
    },
    {
      "type": "RECTANGLE",
      "width": 80,
      "height": 40,
      "color": "yellow",
    }
  ]);

  final dartCode = 'List<Widget> widgets = ${widgets.toString()};';
  print(dartCode);
}

List<Widget> buildWidgetTreeList(List<dynamic> jsonElements) {
  return [
    for (var jsonElement in jsonElements) buildWidgetTree(jsonElement),
  ];
}

Widget buildWidgetTree(dynamic jsonElement) {
  if (jsonElement is Map<String, dynamic>) {
    String type = jsonElement['type'];

    switch (type) {
      case 'RECTANGLE':
        return buildRectangle(jsonElement);
      // Agregar más casos según sea necesario
      default:
        return SizedBox();
    }
  } else {
    return SizedBox();
  }
}

Widget buildRectangle(Map<String, dynamic> rectangleData) {
  return Container(
    width: rectangleData['width'].toDouble(),
    height: rectangleData['height'].toDouble(),
    color: _getColorFromString(rectangleData['color']),
    child: Column(
      children: buildWidgetTreeList(rectangleData['children'] ?? []),
    ),
  );
}

Color _getColorFromString(String colorString) {
  // Implementa la lógica para convertir el color de cadena a Color
  // En este ejemplo, simplemente estamos usando Colors.black como valor predeterminado
  return Colors.black;
}
