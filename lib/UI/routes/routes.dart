



import 'package:batman_spash_screen/UI/general/logo_assets.dart';
import 'package:batman_spash_screen/UI/pagesModules/pagemodules.dart';
import 'package:batman_spash_screen/UI/pagesModules/productos_gestion_page.dart';
import 'package:flutter/material.dart';

final pageRoutes = <Route> [
  Route(icon: const Icon(Icons.people,color: Colors.white,size: 25,), title: 'Usuarios', page:  const UsuariogestionPage()),
  Route(icon: const Icon(Icons.home,color: Colors.white,size: 25,), title: 'Productos', page:   const ProductoGestionPage()),
  Route(icon: const Icon(Icons.apple,color: Colors.white,size: 25,), title: 'Equipos', page: const ProductoGestionPage()),
  Route(icon: const Icon(Icons.android,color: Colors.white,size: 25,), title: 'E/S', page:  const ProductoGestionPage()),
  Route(icon: const Icon(Icons.window,color: Colors.white,size: 25,), title: 'Grupos', page: const ProductoGestionPage()),
  Route(icon: const Icon(Icons.flutter_dash_outlined,color: Colors.white,size: 25,), title: 'Reportes', page: const ProductoGestionPage()),
  Route(icon: const Icon(Icons.flutter_dash_outlined,color: Colors.white,size: 25,), title: 'Otros', page:  const ProductoGestionPage()),

];


final pageRoutesAlmacen = <Routes> [
  Routes( image: const AssetImage(AssetsData.chillca),title: 'Cusco', page:  const UsuariogestionPage()),
  Routes(image: const AssetImage(AssetsData.huampo), title: 'Huito', page:   const ProductoGestionPage()),
  Routes(image: const AssetImage(AssetsData.machu), title: 'Chillca', page: const ProductoGestionPage()),
  Routes( image: const AssetImage(AssetsData.ananta),title: 'Machu', page:  const ProductoGestionPage()),
  Routes( image: const AssetImage(AssetsData.huampo),title: 'Ananta', page:  const ProductoGestionPage()),
  Routes( image: const AssetImage(AssetsData.chillca),title: 'Huampo', page: const ProductoGestionPage()),
  Routes( image: const AssetImage(AssetsData.ananta),title: 'Otros', page:  const ProductoGestionPage()),

];

class Route{
   final Icon? icon;
    final String title;
    final Widget page;
    final ImageProvider? image;
  Route({ this.image,this.icon, required this.title, required this.page});
}


class Routes{

    final String title;
    final Widget page;
    final ImageProvider image;
  Routes({required this.image, required this.title, required this.page});
}