


import 'package:batman_spash_screen/UI/pagesModules/almacen_gestion_page.dart';
import 'package:batman_spash_screen/UI/pagesModules/pages_delete.dart';
import 'package:batman_spash_screen/UI/pagesModules/usuarios_gestion_page.dart';
import 'package:flutter/material.dart';

final pageRoutes = <Route> [
  Route(icon: const Icon(Icons.people), title: 'Usuarios', page:  UserGestionPage()),
  Route(icon: const Icon(Icons.home), title: 'Almacen', page:  const AlmacenGestionPage()),
  Route(icon: const Icon(Icons.apple), title: 'Ventas', page: const Page3()),
  Route(icon: const Icon(Icons.android), title: 'Presupuestos', page: const Page4()),
  Route(icon: const Icon(Icons.window), title: 'Grupos', page: const Page5()),
  Route(icon: const Icon(Icons.flutter_dash_outlined), title: 'Reportes', page: const Page5()),
  Route(icon: const Icon(Icons.flutter_dash_outlined), title: 'Otros', page: const Page5()),

];


class Route{
   final Icon icon;
    final String title;
    final Widget page;
  Route({required this.icon, required this.title, required this.page});
}