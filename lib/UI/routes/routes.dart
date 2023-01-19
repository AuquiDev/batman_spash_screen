


import 'package:batman_spash_screen/UI/pagesDelete/pages_delete.dart';
import 'package:flutter/material.dart';

final pageRoutes = <Route> [
  Route(icon: const Icon(Icons.abc), title: 'Reportes', page: const Page1()),
  Route(icon: const Icon(Icons.abc), title: 'Usuarios', page: const Page2()),
  Route(icon: const Icon(Icons.abc), title: 'Ventas', page: const Page3()),
  Route(icon: const Icon(Icons.abc), title: 'Presupuestos', page: const Page4()),
  Route(icon: const Icon(Icons.abc), title: 'Grupos', page: const Page5()),

];


class Route{
   final Icon icon;
    final String title;
    final Widget page;
  Route({required this.icon, required this.title, required this.page});
}