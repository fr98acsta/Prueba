import 'principal.dart';

void main() {
  // ignore: unused_local_variable
  late List<List<dynamic>> lista3;
  late List<String> lista1;
  late List<App> lista2;
  late String jsonUrls;

  // Esto lo mejorare con un Map o algo
  // Solo provisional
  jsonUrls =
      """C:\\Users\\Usuario\\Desktop\\Flutter\\Figma Json\\fitness.plugin.json""";
  lista1 = jsonUrls.split('\n');

  // Lista de Apps
  // [App1, ... , AppN]
  lista2 = appUrls(lista1);

  // Cada Indice es una App con sus Paginas Divididas
  // [[Pag0, ... , PagN], .... ,[Pag0, ... , PagN]]
  lista3 = appPages(lista2);
}
