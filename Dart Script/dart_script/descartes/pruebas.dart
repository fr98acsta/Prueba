// import 'package:flutter/material.dart';

// abstract class Element {
//   late String type;
//   late String color;
//   late double width;
//   late double height;
//   List<Element>? children;

//   Element.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     color = json['color'];
//     width = json['width'].toDouble();
//     height = json['height'].toDouble();

//     if (json['children'] != null) {
//       children = List<Element>.from(json['children'].map((childJson) => createElement(childJson)));
//     }
//   }

//   String toWidgetString();

//   Color getColorFromString(String colorString) {
//     return Colors.black;
//   }

//   static Element createElement(Map<String, dynamic> json) {
//     switch (json['type']) {
//       case 'Frame':
//         return Frame.fromJson(json);
//       case 'Text':
//         return TextElement.fromJson(json);
//       case 'Vector':
//         return Vector.fromJson(json);
//       case 'Image':
//         return ImageElement.fromJson(json);
//       // Puedes agregar más casos según sea necesario
//       default:
//         throw ArgumentError('Tipo de elemento desconocido: ${json['type']}');
//     }
//   }
// }

// class Frame extends Element {
//   Frame.fromJson(Map<String, dynamic> json) : super.fromJson(json);

//   @override
//   String toWidgetString() {
//     if (children != null && children!.isNotEmpty) {
//       final childrenString = children!.map((child) => child.toWidgetString()).join(',\n');
//       return 'Container(\n'
//           '  width: $width,\n'
//           '  height: $height,\n'
//           '  color: getColorFromString("$color"),\n'
//           '  child: Column(\n'
//           '    children: [\n'
//           '      $childrenString\n'
//           '    ],\n'
//           '  ),\n'
//           ')';
//     } else {
//       return 'Container(\n'
//           '  width: $width,\n'
//           '  height: $height,\n'
//           '  color: getColorFromString("$color"),\n'
//           ')';
//     }
//   }
// }

// class TextElement extends Element {
//   late String text;

//   TextElement.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
//     text = json['text'];
//   }

//   @override
//   String toWidgetString() {
//     return 'Text(\n'
//         '  "$text",\n'
//         '  style: TextStyle(\n'
//         '    color: getColorFromString("$color"),\n'
//         '  ),\n'
//         ')';
//   }
// }

// class Vector extends Element {
//   Vector.fromJson(Map<String, dynamic> json) : super.fromJson(json);

//   @override
//   String toWidgetString() {
//     return 'CustomPaint(\n'
//         '  painter: VectorPainter(vectorData: ${children![0].toWidgetString()}),\n'
//         ')';
//   }
// }

// class ImageElement extends Element {
//   ImageElement.fromJson(Map<String, dynamic> json) : super.fromJson(json);

//   @override
//   String toWidgetString() {
//     return 'Image.asset(\n'
//         '  "$color",\n'
//         ')';
//   }
// }

// class VectorPainter extends CustomPainter {
//   late Element vectorData;

//   VectorPainter({required this.vectorData});

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Implementa aquí la lógica de dibujo según los datos del vector
//     // Puedes usar el objeto 'canvas' para realizar operaciones de dibujo

//     // Ejemplo: Dibuja un rectángulo azul
//     final paint = Paint()..color = Colors.blue;
//     final rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
//     canvas.drawRect(rect, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

// void main() {
//   // Ejemplo de JSON con varios tipos de elementos
//   Map<String, dynamic> jsonData = {
//     "elements": [
//       {
//         "type": "Frame",
//         "color": "red",
//         "width": 100,
//         "height": 50,
//         "children": [
//           {
//             "type": "Text",
//             "color": "blue",
//             "width": 50,
//             "height": 25,
//             "text": "Hello"
//           },
//           {
//             "type": "Vector",
//             "color": "green",
//             "width": 50,
//             "height": 25,
//             "children": [
//               {
//                 "type": "Frame",
//                 "color": "yellow",
//                 "width": 30,
//                 "height": 15
//               }
//             ]
//           }
//         ]
//       },
//       {
//         "type": "Image",
//         "color": "path/to/image.png",
//         "width": 80,
//         "height": 40
//       }
//     ]
//   };

//   // Convertir JSON a lista de Element
//   List<Element> elements = List<Element>.from(jsonData['elements'].map((elementJson) => Element.createElement(elementJson)));

//   // Convertir lista de Element a lista de Widgets
//   final List<String> widgetTreeStrings = elements.map((element) => element.toWidgetString()).toList();

//   // Imprimir la cadena de texto
//   widgetTreeStrings.forEach(print);
// }

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedVisibilityWidget(
            key: Key('child'),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            animations: [
              AnimationConfig<double>(
                begin: 0.0,
                end: 1.0,
                startFraction: 0.0,
                endFraction: 0.25,
                curve: Curves.easeInOut,
              ),
              AnimationConfig<Alignment>(
                begin: Alignment.center,
                end: Alignment.topRight,
                startFraction: 0.25,
                endFraction: 0.75,
                curve: Curves.easeInOut,
              ),
              AnimationConfig<Color>(
                begin: Color(0xFF2196F3),
                end: Color(0xFFFE4639),
                startFraction: 0.75,
                endFraction: 1.0,
                curve: Curves.easeInOut,
              ),
            ],
            totalDuration: Duration(seconds: 4),
            // onVisibilityChanged: () {
            //   // Hacer algo cuando la visibilidad cambia
            // },
            visibilityThreshold: 0.8,
          ),
        ),
      ),
    );
  }
}

class AnimatedVisibilityWidget extends StatefulWidget {
  final Widget child;
  final List<AnimationConfig> animations;
  final Duration totalDuration;
  // final VoidCallback onVisibilityChanged;
  final double visibilityThreshold;

  AnimatedVisibilityWidget({
    required Key key,
    required this.child,
    required this.animations,
    required this.totalDuration,
    //  this.onVisibilityChanged,
    this.visibilityThreshold = 0.8,
  }) : super(key: key);

  @override
  _AnimatedVisibilityWidgetState createState() =>
      _AnimatedVisibilityWidgetState();
}

class AnimationConfig<T> {
  final Tween<T> tween;
  final double startFraction;
  final double endFraction;
  final Curve curve;

  AnimationConfig({
    required T begin,
    required T end,
    required this.startFraction,
    required this.endFraction,
    this.curve = Curves.linear,
  }) : tween = Tween<T>(begin: begin, end: end);
}

class _AnimatedVisibilityWidgetState extends State<AnimatedVisibilityWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<dynamic>> _animationList;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.totalDuration);

    _animationList = widget.animations.map((config) {
      return config.tween.animate(
        CurvedAnimation(
          parent: _controller,
          curve: config.curve,
        ),
      );
    }).toList();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Aplica todas las animaciones en la lista de manera acumulativa usando map y reduce
    Widget animatedChild = widget.child;

    for (int i = 0; i < _animationList.length; i++) {
      animatedChild = _applyAnimation(animatedChild, _animationList[i]);
    }

    return VisibilityDetector(
      key: widget.key!,
      onVisibilityChanged: (info) {
        double visibleFraction = info.visibleFraction;
        bool isVisible = visibleFraction >= widget.visibilityThreshold;

        if (isVisible && !_controller.isAnimating) {
          _controller.forward();
        } else {
          _controller.reverse();
        }

        // widget.onVisibilityChanged();
      },
      child: AnimatedBuilder(
        animation: _controller,
        child: animatedChild,
        builder: (BuildContext context, Widget? animatedChild) {
          return animatedChild!;
        },
      ),
    );
  }

  Widget _applyAnimation(Widget child, Animation<dynamic> animation) {
    if (animation is Animation<double>) {
      return _applyDoubleAnimation(child, animation);
    } else if (animation is Animation<Color>) {
      return _applyColorAnimation(child, animation);
    } else if (animation is Animation<Alignment>) {
      return _applyAlignmentAnimation(child, animation);
    } else if (animation is Animation<double>) {
      return _applyOpacityAnimation(child, animation);
    }
    // Agrega más casos según sea necesario para otros tipos de animaciones
    return child;
  }

  Widget _applyDoubleAnimation(Widget child, Animation<double> animation) {
    return Transform.scale(
      scale: animation.value,
      child: child,
    );
  }

  Widget _applyColorAnimation(Widget child, Animation<Color> animation) {
    return ColoredBox(
      color: animation.value,
      child: child,
    );
  }

  Widget _applyAlignmentAnimation(
      Widget child, Animation<Alignment> animation) {
    return Transform.translate(
      offset: Offset(animation.value.x, animation.value.y),
      child: child,
    );
  }

  Widget _applyOpacityAnimation(Widget child, Animation<double> animation) {
    return Opacity(
      opacity: animation.value,
      child: child,
    );
  }
}
