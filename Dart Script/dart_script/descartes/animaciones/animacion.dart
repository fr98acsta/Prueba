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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 700,
                color: Colors.red,
              ),
              SizedBox(
                width: double.infinity,
                height: 400,
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
                      begin: 0.5,
                      end: 1.0,
                      startFraction: 0.0,
                      endFraction: 0.25,
                      curve: Curves.easeInOut,
                    ),
                    // AnimationConfig<Alignment>(
                    //   begin: Alignment.center,
                    //   end: Alignment.topRight,
                    //   startFraction: 0.25,
                    //   endFraction: 1,
                    //   curve: Curves.easeInOut,
                    // ),
                    // AnimationConfig<Color>(
                    //   begin: Colors.blue,
                    //   end: Colors.red,
                    //   startFraction: 0.75,
                    //   endFraction: 1.0,
                    //   curve: Curves.easeInOut,
                    // ),
                  ],
                  totalDuration: Duration(seconds: 4),
                  // onVisibilityChanged: () {
                  //   // Hacer algo cuando la visibilidad cambia
                  // },
                  visibilityThreshold: 1,
                ),
              ),
              Container(
                width: double.infinity,
                height: 700,
                color: Colors.green,
              ),
            ],
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
    this.visibilityThreshold = 1,
  }) : super(key: key);

  @override
  _AnimatedVisibilityWidgetState createState() =>
      _AnimatedVisibilityWidgetState();
}

class AnimationConfig<T> {
  final double startFraction;
  final double endFraction;
  final Curve curve;
  final Tween<T> tween;

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
          // reverseCurve:
          // Interval(config.startFraction, config.endFraction).flipped,
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
      child: animatedChild,
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

  // Widget _applyAlignmentAnimation(
  //     Widget child, Animation<Alignment> animation) {
  //   return Transform.translate(
  //     offset: Offset(animation.value.x, animation.value.y),
  //     child: child,
  //   );
  // }

  Widget _applyAlignmentAnimation(
      Widget child, Animation<Alignment> animation) {
    return Align(
      alignment: animation.value,
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




// void main() {
  
//   double width = 200;
//   double height = 500;
  
  
//   String miprueba = """
//   Container(
//   width: $width,
//   height: $height,
//   child: ${miWidget(texto: 'Hola', color: "red")},
//   )
  
//   """;
  
//   print(miprueba);
  
// }


// // Una clase de un widget que muestra un texto con un fondo de color y un borde redondeado
// String  miWidget ({ required  String texto, required  String color}){
 
  
//   return """  Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.$color,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Text(
//         $texto,
//         style: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color: Colors.$color,
//         ),
//       ),
//     );
//   }""";
   

// }
