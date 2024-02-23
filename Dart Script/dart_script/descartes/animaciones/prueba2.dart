import 'package:flutter/material.dart';


// AlignmentGeometryTween:

// Descripción: Realiza interpolación entre dos valores de tipo AlignmentGeometry.
// Ejemplo:
 
AlignmentGeometryTween alignmentGeometryTween = 
AlignmentGeometryTween(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);


Widget align = Align(
  alignment: animation.value,
  child: Widget,
);



// AlignmentTween:

// Descripción: Realiza interpolación entre dos valores de tipo Alignment.
// Ejemplo:
 
AlignmentTween(
  {begin: Alignment.bottomLeft,
  end: Alignment.topRight,}
)



// BorderRadiusTween:

// Descripción: Realiza interpolación entre dos valores de tipo BorderRadius.
// Ejemplo:
 
BorderRadiusTween(
  begin: BorderRadius.circular(0.0),
  end: BorderRadius.circular(20.0),
)
// BorderTween:

// Descripción: Realiza interpolación entre dos valores de tipo Border.
// Ejemplo:
 
BorderTween(
  begin: Border.all(color: Colors.red, width: 1.0),
  end: Border.all(color: Colors.blue, width: 3.0),
)
// BoxConstraintsTween:

// Descripción: Realiza interpolación entre dos valores de tipo BoxConstraints.
// Ejemplo:
 
BoxConstraintsTween(
  begin: BoxConstraints.tightFor(width: 100.0, height: 100.0),
  end: BoxConstraints.tightFor(width: 200.0, height: 200.0),
)
// ColorTween:

// Descripción: Realiza interpolación entre dos valores de tipo Color.
// Ejemplo:
 
ColorTween(
  begin: Colors.blue,
  end: Colors.red,
)
// ConstantTween:

// Descripción: Retorna un valor constante sin interpolación.
// Ejemplo:
 
ConstantTween(42)


// DecorationTween:

// Descripción: Realiza interpolación entre dos valores de tipo Decoration.
// Ejemplo:
 
DecorationTween(
  begin: BoxDecoration(color: Colors.green),
  end: BoxDecoration(color: Colors.yellow),
)
// EdgeInsetsGeometryTween:

// Descripción: Realiza interpolación entre dos valores de tipo EdgeInsetsGeometry.
// Ejemplo:
 
EdgeInsetsGeometryTween(
  begin: EdgeInsets.all(0.0),
  end: EdgeInsets.all(20.0),
)
// EdgeInsetsTween:

// Descripción: Realiza interpolación entre dos valores de tipo EdgeInsets.
// Ejemplo:
 
EdgeInsetsTween(
  begin: EdgeInsets.all(0.0),
  end: EdgeInsets.all(20.0),
)
// FractionalOffsetTween:

// Descripción: Realiza interpolación entre dos valores de tipo FractionalOffset.
// Ejemplo:
 
FractionalOffsetTween(
  begin: FractionalOffset(0.0, 0.0),
  end: FractionalOffset(1.0, 1.0),
)
// IntTween:

// Descripción: Realiza interpolación entre dos valores de tipo int.
// Ejemplo:
 
IntTween(
  begin: 0,
  end: 100,
)
// MaterialPointArcTween:

// Descripción: Realiza interpolación entre dos valores de tipo MaterialPointArc.
// Ejemplo:
 
MaterialPointArcTween(
  begin: MaterialPointArc(point: const Offset(10.0, 10.0), height: 10.0),
  end: MaterialPointArc(point: const Offset(50.0, 50.0), height: 50.0),
)
// Matrix4Tween:

// Descripción: Realiza interpolación entre dos valores de tipo Matrix4.
// Ejemplo:
 
Matrix4Tween(
  begin: Matrix4.identity(),
  end: Matrix4.rotationZ(0.5),
)
// RectTween:

// Descripción: Realiza interpolación entre dos valores de tipo Rect.
// Ejemplo:
 
RectTween(
  begin: Rect.fromPoints(Offset(10.0, 10.0), Offset(50.0, 50.0)),
  end: Rect.fromPoints(Offset(20.0, 20.0), Offset(80.0, 80.0)),
)

// RelativeRectTween:

// Descripción: Realiza interpolación entre dos valores de tipo RelativeRect.
// Ejemplo:
 
RelativeRectTween(
  begin: RelativeRect.fromLTRB(10.0, 10.0, 0.0, 0.0),
  end: RelativeRect.fromLTRB(20.0, 20.0, 0.0, 0.0),
)
// ReverseTween:

// Descripción: Invierte la interpolación de otro Tween.
// Ejemplo:
 
ReverseTween<ColorTween>(
  parent: ColorTween(begin: Colors.red, end: Colors.blue),
)
// ShapeBorderTween:

// Descripción: Realiza interpolación entre dos valores de tipo ShapeBorder.
// Ejemplo:
 
ShapeBorderTween(
  begin: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
  end: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
)
// SizeTween:

// Descripción: Realiza interpolación entre dos valores de tipo Size.
// Ejemplo:
 
SizeTween(
  begin: Size(100.0, 100.0),
  end: Size(200.0, 200.0),
)
// StepTween:

// Descripción: Realiza interpolación discreta entre dos valores de tipo int.
// Ejemplo:
 
StepTween(
  begin: 0,
  end: 10,
  steps: 5,
)
// TextStyleTween:

// Descripción: Realiza interpolación entre dos valores de tipo TextStyle.
// Ejemplo:
 
TextStyleTween(
  begin: TextStyle(fontSize: 16.0, color: Colors.black),
  end: TextStyle(fontSize: 24.0, color: Colors.red),
)
// ThemeDataTween:

// Descripción: Realiza interpolación entre dos valores de tipo ThemeData.
// Ejemplo:
 
ThemeDataTween(
  begin: ThemeData.light(),
  end: ThemeData.dark(),
)


// AlignmentTween:

 
Align(
  alignment: animation.value,
  child: Widget,
)
// BorderRadiusTween:

 
Container(
  decoration: BoxDecoration(
    borderRadius: animation.value,
  ),
  child: Widget,
)
// BorderTween:

 
Container(
  decoration: BoxDecoration(
    border: animation.value,
  ),
  child: Widget,
)
// BoxConstraintsTween:

 
ConstrainedBox(
  constraints: animation.value,
  child: Widget,
)
// ColorTween:

 
ColoredBox(
  color: animation.value,
  child: Widget,
)
// ConstantTween:

 
// No se aplica directamente a un widget
// 

// DecorationTween:

 
Container(
  decoration: animation.value,
  child: Widget,
)
// EdgeInsetsGeometryTween:

 
Padding(
  padding: animation.value,
  child: Widget,
)
// EdgeInsetsTween:

 
Padding(
  padding: animation.value,
  child: Widget,
)
// FractionalOffsetTween:

 
Positioned(
  left: animation.value.dx,
  top: animation.value.dy,
  child: Widget,
)
// IntTween:

 
Text(
  animation.value.toString(),
  style: TextStyle(fontSize: 16.0),
)
// MaterialPointArcTween:

 
Positioned(
  left: animation.value.point.dx,
  top: animation.value.point.dy,
  child: Widget,
)
// Matrix4Tween:

 
Transform(
  transform: Matrix4Tween(
    begin: Matrix4.identity(),
    end: Matrix4.rotationZ(0.5),
  ).transform(animation.value),
  child: Widget,
)
// RectTween:

 
Positioned(
  left: animation.value.left,
  top: animation.value.top,
  child: Widget,
)
// RelativeRectTween:

 
Positioned(
  left: animation.value.left,
  top: animation.value.top,
  right: animation.value.right,
  bottom: animation.value.bottom,
  child: Widget,
)
// ReverseTween:

 
// Se envuelve según el tipo de Tween que estás invirtiendo


// ShapeBorderTween:

 
Container(
  decoration: ShapeDecoration(
    shape: animation.value,
    color: Colors.blue,
  ),
  child: Widget,
)
// SizeTween:


 
SizedBox(
  width: animation.value.width,
  height: animation.value.height,
  child: Widget,
)
// StepTween:

 
Text(
  animation.value.toString(),
  style: TextStyle(fontSize: 16.0),
)
// TextStyleTween:

 
Text(
  'Hello',
  style: animation.value,
)
// ThemeDataTween:

 
MaterialApp(
  theme: animation.value,
  home: Widget,
)
// Estos ejemplos muestran cómo envolver un widget específico para aplicar la animación generada por cada implementador de Tween. Recuerda adaptar según tus necesidades y la estructura de tu interfaz de usuario.
//LO QUE PUEDO HACER ES DIRECTAMENTE PONER EN DONDE VA UN TEXTO O UN CONTAINER O UN LO QUE SEA
// COMO VA ESTAR EN STRING PRAMAETRADO POR LOS VALORES, LE PONDRE UN CONDICIONAL DE FLAG DE SI ES ANIMADO
// DE MANERA QUE SI ES ANIMADO SE LE PONE LOS VALORES DE LA ANIMACION
/*

Implementador	Extiende de
AlignmentGeometryTween	AlignmentGeometryTween
AlignmentTween	AlignmentTween
BorderRadiusTween	Tween<BorderRadius>
BorderTween	Tween<Border>
BoxConstraintsTween	Tween<BoxConstraints>
ColorTween	Tween<Color>
ConstantTween	Tween<T>
DecorationTween	Tween<Decoration>
EdgeInsetsGeometryTween	Tween<EdgeInsetsGeometry>
EdgeInsetsTween	Tween<EdgeInsets>
FractionalOffsetTween	Tween<FractionalOffset>
IntTween	Tween<int>
MaterialPointArcTween	Tween<MaterialPointArcTween>
Matrix4Tween	Tween<Matrix4>
RectTween	Tween<Rect>
RelativeRectTween	Tween<RelativeRect>
ReverseTween	Tween<T> (Inversión de otro Tween<T>)
ShapeBorderTween	Tween<ShapeBorder>
SizeTween	Tween<Size>
StepTween	Tween<int> (Interpolación discreta)
TextStyleTween	Tween<TextStyle>
ThemeDataTween	Tween<ThemeData>

*/