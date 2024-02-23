

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


