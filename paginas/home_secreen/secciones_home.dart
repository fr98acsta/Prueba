// Se podrian poner en vez de funciones variables y listo. Pero no se hace
// porque se necesita pasar el Context.

// Se pondra una carpeta con las secciones de manera:

/// import 'package:mi_app/widgets/seccion1/seccion1.dart';
/// import 'package:mi_app/widgets/seccion2/seccion2.dart';
///                 .....

import 'package:flutter/material.dart';
import 'package:flutter_application_1/funciones.dart';

// Header
List<Widget> seccion1(BuildContext context) {
  return [
    // Imagen Perfil
    Align(
      alignment: const AlignmentDirectional(-0.9, -0.9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(doResponsive(100, context)),
        child: Image.network(
          'https://picsum.photos/seed/111/602',
          width: doResponsive(40, context),
          height: doResponsive(40, context),
          fit: BoxFit.cover,
        ),
      ),
    ),
    // Saludo
    Align(
      alignment: const AlignmentDirectional(-0.49, -0.91),
      child: Text(
        'Good morning!',
        style: TextStyle(
          fontFamily: 'Manrope',
          color: const Color(0xFFBDBDBD),
          height: 1.4,
          fontSize: doResponsiveText(15, context),
        ),
      ),
    ),
    // Nombre
    Align(
      alignment: const AlignmentDirectional(-0.43, -0.87),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
        child: Text(
          'Franquito Acosta',
          style: TextStyle(
            fontFamily: 'Manrope',
            color: Colors.white,
            fontSize: doResponsiveText(15, context),
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ),
    ),
    // Favoritos
    Align(
      alignment: const AlignmentDirectional(0.61, -0.88),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {},
        child: Icon(
          Icons.favorite_rounded,
          color: Colors.white,
          size: doResponsive(24, context),
        ),
      ),
    ),
    // Notificaciones
    Align(
      alignment: const AlignmentDirectional(0.9, -0.88),
      child: Icon(
        Icons.notifications,
        color: Colors.white,
        size: doResponsive(24, context),
      ),
    ),
    Align(
      alignment: const AlignmentDirectional(0.9, -0.88),
      child: Container(
        width: doResponsive(8, context),
        height: doResponsive(8, context),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          border: Border.all(
            width: 0,
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Container(
            width: doResponsive(6, context),
            height: doResponsive(6, context),
            decoration: const BoxDecoration(
              color: Color(0xFFFF0000),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    ),
    // Dashboard
    Align(
      alignment: const AlignmentDirectional(-0.91, -0.76),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Image.network(
          'assets/images/Vector_(3).svg',
          width: doResponsive(24, context),
          height: doResponsive(24, context),
          fit: BoxFit.contain,
        ),
      ),
    ),
    Align(
      alignment: const AlignmentDirectional(-0.57, -0.76),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
        child: Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Manrope',
            color: Colors.white,
            fontSize: doResponsiveText(20, context),
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
        ),
      ),
    ),
  ];
}

// Search & Tags
List<Widget> seccion2(BuildContext context) {
  return [
    // Buscador
    Align(
      alignment: const AlignmentDirectional(0, -0.6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: doResponsive(335, context),
          height: doResponsive(56, context),
          constraints: BoxConstraints(
            maxWidth: doResponsive(346, context),
            maxHeight: doResponsive(56, context),
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF252525),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Icon(
                      Icons.search_outlined,
                      color: const Color(0xFFBDBDBD),
                      size: doResponsive(24, context),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontFamily: 'Manrope',
                          color: const Color(0xFF828282),
                          fontSize: doResponsiveText(16, context),
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        color: const Color(0xFF828282),
                        fontSize: doResponsiveText(24, context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    // Tags
    Align(
      alignment: const AlignmentDirectional(0, -0.4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: doResponsive(50, context),
                height: doResponsive(50, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: doResponsive(24, context),
                  ),
                ),
              ),
              SizedBox(
                width: doResponsive(101, context),
                height: doResponsive(48, context),
                child: Stack(
                  children: [
                    Container(
                      width: doResponsive(101, context),
                      height: doResponsive(48, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Container(
                        width: doResponsive(93, context),
                        height: doResponsive(40, context),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7FFC9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Text(
                            'My Goals',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              fontSize: doResponsiveText(14, context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: doResponsive(101, context),
                height: doResponsive(48, context),
                child: Stack(
                  children: [
                    Container(
                      width: doResponsive(101, context),
                      height: doResponsive(48, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Container(
                        width: doResponsive(93, context),
                        height: doResponsive(40, context),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC9E8FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Text(
                            'My Goals',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              fontSize: doResponsiveText(14, context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: doResponsive(101, context),
                height: doResponsive(48, context),
                child: Stack(
                  children: [
                    Container(
                      width: doResponsive(101, context),
                      height: doResponsive(48, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Container(
                        width: doResponsive(93, context),
                        height: doResponsive(40, context),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF9385),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Text(
                            'My Goals',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              fontSize: doResponsiveText(14, context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
                .withSpace(10, context, pad: true)
                .withPadding(delante: 20, atras: 20, context: context)),
      ),
    ),
  ];
}

// Main Workout
List<Widget> seccion3(BuildContext context) {
  return [
    // Titulo
    Align(
      alignment: const AlignmentDirectional(-0.77, -0.21),
      child: Text(
        'Night Workout Plan',
        style: TextStyle(
          fontFamily: 'Manrope',
          color: Colors.white,
          fontSize: doResponsiveText(18, context),
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
      ),
    ),
    // Fecha
    Align(
      alignment: const AlignmentDirectional(0.85, -0.21),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Mon',
              style: TextStyle(
                fontFamily: 'Manrope',
                color: Colors.purple,
                height: 1.4,
                fontSize: doResponsiveText(12, context),
              ),
            ),
            Text(
              '26',
              style: TextStyle(
                fontFamily: 'Manrope',
                color: Colors.purple,
                height: 1.4,
                fontSize: doResponsiveText(12, context),
              ),
            ),
            Text(
              'Apr',
              style: TextStyle(
                fontFamily: 'Manrope',
                color: Colors.purple,
                height: 1.4,
                fontSize: doResponsiveText(12, context),
              ),
            )
          ].withSpace(3, context)),
    ),
    // Bloque Entreno
    Align(
      alignment: const AlignmentDirectional(0, 0.01),
      child: Container(
        width: doResponsive(312, context),
        height: doResponsive(155, context),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 54, 54, 54),
          borderRadius: BorderRadius.circular(doResponsive(8, context)),
        ),
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(-0.91, 0.51),
              child: Text(
                'Day',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.white,
                  fontSize: doResponsiveText(18, context),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.68, 0.52),
              child: Text(
                '01',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.white,
                  fontSize: doResponsiveText(18, context),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.54, 0.52),
              child: Text(
                '-',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.white,
                  fontSize: doResponsiveText(18, context),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.33, 0.52),
              child: Text(
                'Warm Up',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.white,
                  fontSize: doResponsiveText(18, context),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.8, 0.82),
              child: Text(
                '07:00 - 08:00 AM',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    color: Colors.purple,
                    height: 1.4,
                    fontSize: doResponsiveText(10, context)),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.91, 0.78),
              child: Container(
                width: doResponsive(2, context),
                height: doResponsive(10, context),
                decoration: const BoxDecoration(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ];
}

//Categories Workouts
List<Widget> seccion4(BuildContext context) {
  return [
    // Titulo
    Align(
      alignment: const AlignmentDirectional(-0.77, 0.33),
      child: Text(
        'Workout Categories',
        style: TextStyle(
          fontFamily: 'Manrope',
          color: Colors.white,
          fontSize: doResponsiveText(18, context),
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
      ),
    ),
    Align(
      alignment: const AlignmentDirectional(0.87, 0.33),
      child: Text(
        'See All',
        style: TextStyle(
            fontFamily: 'Manrope',
            color: Colors.purple,
            height: 1.4,
            fontSize: doResponsive(14, context)),
      ),
    ),
    // Filtro Niveles
    Align(
      alignment: const AlignmentDirectional(0, 0.43),
      child: Container(
        width: doResponsive(315, context),
        height: doResponsive(28, context),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 153, 153, 153),
          borderRadius: BorderRadius.circular(doResponsive(20, context)),
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(1, 1),
                child: Container(
                  width: doResponsive(100, context),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF0000),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.83, 0),
                child: Text(
                  'Beginer',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    color: Colors.white,
                    fontSize: doResponsiveText(13, context),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Text(
                  'Intermediate',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    color: Colors.white,
                    fontSize: doResponsiveText(13, context),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.83, 0),
                child: Text(
                  'Advance',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    color: Colors.white,
                    fontSize: doResponsiveText(13, context),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    // Entrenos Recomendados
    Align(
      alignment: const AlignmentDirectional(0, 0.84),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: doResponsive(303, context),
                height: doResponsive(185, context),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.88, -0.83),
                        child: Container(
                          width: doResponsive(63, context),
                          height: doResponsive(22, context),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Text(
                              'Premium',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: doResponsiveText(11, context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.01, 0.5),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 2, 0, 0),
                          child: Text(
                            'Cardio training sets',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: Colors.white,
                              fontSize: doResponsiveText(18, context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.01, 0.76),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 5, 0, 0),
                          child: Text(
                            'Franco Acosta',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: Colors.white,
                              fontSize: doResponsiveText(11, context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.86, 0.8),
                        child: Container(
                          width: doResponsive(60, context),
                          height: doResponsive(28, context),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4F4F4F),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-1, 0),
                                    child: Icon(
                                      Icons.star_sharp,
                                      color: Colors.yellow,
                                      size: doResponsive(16, context),
                                    ),
                                  ),
                                  Text(
                                    '4.7',
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      color: Colors.white,
                                      height: 1.4,
                                      fontSize: doResponsiveText(12, context),
                                    ),
                                  ),
                                ].withSpace(8, context, pad: true).withPadding(
                                    delante: 8, atras: 7, context: context)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: doResponsive(303, context),
                height: doResponsive(185, context),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 208, 199, 199),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.88, -0.83),
                        child: Container(
                          width: doResponsive(63, context),
                          height: doResponsive(22, context),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Text(
                              'Premium',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: doResponsiveText(11, context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.01, 0.5),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 2, 0, 0),
                          child: Text(
                            'Cardio training sets',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: Colors.white,
                              fontSize: doResponsiveText(18, context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.01, 0.76),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 5, 0, 0),
                          child: Text(
                            'Franco Acosta',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: Colors.white,
                              fontSize: doResponsive(11, context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.86, 0.8),
                        child: Container(
                          width: doResponsive(60, context),
                          height: doResponsive(28, context),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4F4F4F),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-1, 0),
                                    child: Icon(
                                      Icons.star_sharp,
                                      color: Colors.grey,
                                      size: doResponsive(16, context),
                                    ),
                                  ),
                                  Text(
                                    '4.7',
                                    style: TextStyle(
                                        fontFamily: 'Manrope',
                                        color: Colors.white,
                                        height: 1.4,
                                        fontSize:
                                            doResponsiveText(12, context)),
                                  ),
                                ].withSpace(8, context, pad: true).withPadding(
                                    delante: 8, atras: 7, context: context)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ].withSpace(20, context)),
      ),
    ),
  ];
}

/// ---------
// List<Widget> seccion5(BuildContext context) {
//   return [];
// }

// List<Widget> seccion6(BuildContext context) {
//   return [];
// }

// List<Widget> seccion7(BuildContext context) {
//   return [];
// }

// List<Widget> seccion8(BuildContext context) {
//   return [];
// }
