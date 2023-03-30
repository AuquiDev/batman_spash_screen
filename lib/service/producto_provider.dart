



// ignore_for_file: avoid_print, unused_field

import 'package:batman_spash_screen/Xprueba%20borrar/models_producto.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductoProvider extends ChangeNotifier {


  final String _baseUrl = 'api.sheety.co';
  final String _baseUrlPocket = 'waiki-andean-lodges.fly.dev';
  List<Producto> productoList = [];
  List<Item> productoListpocket = [];


  ProductoProvider(){

    print('Producto provider inicializado');
    getProductoProvider();
    getPocketbaseProvider();
  }

  // getProductoProvider() async {
  //   var url = Uri.https(_baseUrl, '$pathKey/productos');
  //   final response = await http.get(url);
  //   final decodeData = ProductoModel.fromJson(response.body);
  //   productoList = decodeData.productos;
  //   notifyListeners();
  // }
  getProductoProvider() async {
    var url = Uri.https(_baseUrlPocket, '/api/collections/productos/records');
    final response = await http.get(url);
    final decodeData = ProductoModel.fromJson(response.body);
    productoList = decodeData.productos;
    notifyListeners();
  }
  

  getPocketbaseProvider() async {
    var url = Uri.https(_baseUrlPocket, '/api/collections/productos_huito/records');
    final response = await http.get(url);
    final decodeData = PocketbaseModel.fromJson(response.body);
    productoListpocket = decodeData.items;
    // print(productoListpocket[1].categoria);
    notifyListeners();
  }
}