import 'package:flutter/material.dart';

//Hace Responsive a los Widgets
double doResponsive(double size, BuildContext context,
    {int designWidth = 360}) {
  return (MediaQuery.of(context).size.width * size) / designWidth;
}

//Hace Responsive a los Textos
double doResponsiveText(double size, BuildContext context,
    {int designWidth = 360}) {
  return (MediaQuery.of(context).size.width / designWidth) * size;
}

// Pone espacios entre Widgets en Columnas o Filas y gestiona
// con el pad si tiene con el mismo espacio, delante y atras.
extension SpacedFlex on List<Widget> {
  List<Widget> withSpace(double space, context, {bool? pad = false}) {
    //ignore: unnecessary_this
    List<Widget> spacedChildren = this
        .map(
            (widget) => [widget, SizedBox(width: doResponsive(space, context))])
        .expand((pair) => pair)
        .toList();
    pad == true
        ? spacedChildren.removeLast()
        : spacedChildren.insert(
            0, SizedBox(width: doResponsive(space, context)));
    return spacedChildren;
  }
}

// Añade espacio delante o atras en un Column o Row
extension SpacedPadding on List<Widget> {
  List<Widget> withPadding({double? delante, double? atras, context}) {
    List<Widget> paddingChildren = this;

    // bajo != null
    //     ? paddingChildren.add(SizedBox(width: doResponsive(bajo, context)))
    //     : paddingChildren.insert(
    //         0, SizedBox(width: doResponsive(alto!, context)));
    // alto != null
    //     ? paddingChildren.insert(
    //         0, SizedBox(width: doResponsive(alto, context)))
    //     : paddingChildren.add(SizedBox(width: doResponsive(bajo!, context)));

    switch (delante) {
      case null:
        return paddingChildren;
      default:
        paddingChildren.insert(
            0, SizedBox(width: doResponsive(delante, context)));
    }

    switch (atras) {
      case null:
        return paddingChildren;
      default:
        paddingChildren.add(SizedBox(width: doResponsive(atras, context)));

        return paddingChildren;
    }
  }
}

double getRelativeX(x, context) {
  return (2 * x / MediaQuery.of(context).size.width) - 1;
}

double getRelativeY(y, context) {
  return (2 * y / MediaQuery.of(context).size.height) - 1;
}
