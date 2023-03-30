import 'package:batman_spash_screen/Xprueba%20borrar/models_producto.dart';
import 'package:batman_spash_screen/service/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PoketbaseGet extends StatefulWidget {
  const PoketbaseGet({super.key});

  @override
  State<PoketbaseGet> createState() => _PoketbaseGetState();
}

class _PoketbaseGetState extends State<PoketbaseGet> {
  @override
  Widget build(BuildContext context) {
     final porcketbaseprovider = Provider.of<ProductoProvider>(context);
    List<Item> listPocket = porcketbaseprovider.productoListpocket;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              
            });
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          ...List.generate(listPocket.length, (index) {
            final   data =  listPocket[index];
            return ListTile(
              title: Text(data.producto),

            );
          })
        ],
      ),
    );
  }
}