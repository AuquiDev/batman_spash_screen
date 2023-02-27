
// ignore_for_file: file_names

import 'package:batman_spash_screen/Xprueba%20borrar/pizza.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/service/service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PruebaCategory extends StatefulWidget {
  const PruebaCategory({super.key});

  @override
  State<PruebaCategory> createState() => _PruebaCategoryState();
}

class _PruebaCategoryState extends State<PruebaCategory> {
  List<String> categoria = [
    'Aceites y Grasas',
    'Alcohol y bebidas',
    'Alimentos en sacos',
    'Aperitivos y snacks',
    'Bolsas y Contenedores de Plástico',
    'Condimentos',
    'Dulces y postres',
    'Granos, harinas y Cereales',
    'Lácteos y Bebidas Calientes',
    'Limpieza',
    'Otros'
  ];

  String copyC = '';
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<ProductoProvider>(context);
    List<Producto> producto = category.productoList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'.toUpperCase()),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Pizza()));
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextButton(onPressed: (){
                  setState(() {
                    isVisible = true;
                  });
                }, child: const Icon(Icons.view_agenda)),

                ...List.generate(
                    categoria.length,
                    (index) => TextButton(
                          onPressed: () {
                            copyC = categoria[index];
                            isVisible = false;
                            setState(() {});
                          },
                          child: FittedBox(
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  categoria[index],
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ))
              ],
            ),
          ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                   ...producto.map((e) {
                if (e.categoria == copyC) {
                  return ListTile(
                    title: Text(e.categoria),
                    subtitle: Text('${e.id} ${e.descripcin}'),
                    leading: CircleAvatar(
                      child: Image.network(e.imagen),
                    ),
                  );
                } else {
                  return   isVisible== true ? ListTile(
                    title: Text(e.categoria),
                     subtitle: Text('${e.id} ${e.descripcin}'),
                    leading: CircleAvatar(
                      child: Image.network(e.imagen),
                    ),
                  ): const SizedBox();
                }
              }),
              ],
            ),
          ),
        )

        ],
      ),
    );
  }
}
