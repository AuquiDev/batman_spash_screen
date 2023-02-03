



import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/utils/api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductoProvider extends ChangeNotifier {


  final String _baseUrl = 'api.sheety.co';
  List<Producto> productoList = [];


  ProductoProvider(){
    print('Producto provider inicializado');
    getProductoProvider();
  }

  getProductoProvider() async {
    var url = Uri.https(_baseUrl, '$pathKey/productos');
    final response = await http.get(url);
    final decodeData = ProductoModel.fromJson(response.body);
    productoList = decodeData.productos;
    print(productoList[10].descripcin);
    notifyListeners();
  }

}