



import 'package:batman_spash_screen/UI/pagesModules/pagemodules.dart';
import 'package:flutter/material.dart';

final pageRoutes = <Route> [
  Route(icon: const Icon(Icons.people,color: Colors.white,size: 25,), title: 'Usuarios', page:  const UsuariogestionPage()),
  Route(icon: const Icon(Icons.home,color: Colors.white,size: 25,), title: 'Almacen', page:   const VentasWidgetPage()),
  Route(icon: const Icon(Icons.apple,color: Colors.white,size: 25,), title: 'Ventas', page: const VentasWidgetPage()),
  Route(icon: const Icon(Icons.android,color: Colors.white,size: 25,), title: 'Presupuestos', page:  const VentasWidgetPage()),
  Route(icon: const Icon(Icons.window,color: Colors.white,size: 25,), title: 'Grupos', page:  const VentasWidgetPage()),
  Route(icon: const Icon(Icons.flutter_dash_outlined,color: Colors.white,size: 25,), title: 'Reportes', page:  const VentasWidgetPage()),
  Route(icon: const Icon(Icons.flutter_dash_outlined,color: Colors.white,size: 25,), title: 'Otros', page:  const VentasWidgetPage()),

];


class Route{
   final Icon icon;
    final String title;
    final Widget page;
  Route({required this.icon, required this.title, required this.page});
}