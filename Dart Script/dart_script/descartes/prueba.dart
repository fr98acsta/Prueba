import 'dart:convert';
import 'package:flutter/material.dart';

class ColorsUtil {
  static final Map<String, Color> colorMap = {
    'blanco': Colors.white,
    'amarillo': Colors.yellow,
    'rojo': Colors.red,
    // Agrega más colores según sea necesario
  };

  static Color getColorFromString(String colorString) {
    return colorMap[colorString.toLowerCase()] ?? Colors.black;
  }
}

Widget buildWidgetTree(List<dynamic> jsonList) {
  List<Widget> widgets =
      jsonList.map((jsonElement) => buildWidget(jsonElement)).toList();
  return Column(children: widgets);
}

Widget buildWidget(Map<String, dynamic> json) {
  String type = json['type'];
  double width =
      json.containsKey('width') ? json['width']?.toDouble() ?? 0.0 : 0.0;
  double height =
      json.containsKey('height') ? json['height']?.toDouble() ?? 0.0 : 0.0;
  Color color = _getColorFromJson(json);

  List<Widget> children = [];

  if (json.containsKey('children') && json['children'] is List) {
    List<dynamic> childJsonList = json['children'];
    for (var childJson in childJsonList) {
      children.add(buildWidget(childJson));
    }
  }

  if (type == 'frame') {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Column(
        children: children,
      ),
    );
  } else if (type == 'container') {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  } else {
    // Handle other widget types if needed
    return Container();
  }
}

Color _getColorFromJson(Map<String, dynamic> json) {
  if (json.containsKey('color')) {
    String colorString = json['color'];
    return ColorsUtil.getColorFromString(colorString);
  }
  return Colors.black;
}

void main() {
  String jsonString = '''
  [
    {
      "type": "frame",
      "width": 200.0,
      "height": 100.0,
      "color": "azul",
      "children": [
        {
          "type": "frame",
          "width": 150.0,
          "height": 75.0,
          "color": "verde",
          "children": [
            {
              "type": "container",
              "width": 100.0,
              "height": 50.0,
              "color": "rojo"
            }
          ]
        }
      ]
    },
    {
      "type": "frame",
      "width": 300.0,
      "height": 150.0,
      "color": "amarillo",
      "children": [
        // Otros elementos en el mismo nivel
      ]
    }
  ]
  ''';

  List<dynamic> jsonList = json.decode(jsonString);
  Widget result = buildWidgetTree(jsonList);

  runApp(
    MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      home: Scaffold(
        body: Center(
          child: result,
        ),
      ),
    ),
  );
}
