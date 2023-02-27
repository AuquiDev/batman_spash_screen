// ignore_for_file: must_be_immutable

import 'package:batman_spash_screen/UI/general/spaicing.dart';
import 'package:batman_spash_screen/UI/widget/text_ui_widget.dart';
import 'package:batman_spash_screen/Xprueba%20borrar/prueba%20category.dart';
import 'package:batman_spash_screen/Xprueba%20borrar/tecsupMenus/details.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/service/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../UI/splash scren/intro_view_page.dart';
import 'tecsupMenus/itemmenuwidget.dart';

class Pizza extends StatefulWidget {
  const Pizza({super.key});

  @override
  State<Pizza> createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  List<Widget> rute = [
    const PruebaCategory(),
    const IntroViewsPage(),
     const Center(child: Text('Favoritos'),),
    const Center(child: Text('Perfil'),),


  ];

  int nav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: rute[nav],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 0, left: 0),
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(30)),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: nav,
          onTap: (value) {
            nav = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color.fromARGB(255, 155, 246, 69),
          selectedItemColor: const Color.fromARGB(255, 238, 113, 155),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.rocket), label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.cloud_circle), label: 'Ordenes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.rocket), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.cloud_circle), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}




class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Producto> list = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final listProduct = Provider.of<ProductoProvider>(context);
    List<Producto> prodcut = listProduct.productoList;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyleUi(
                text: 'Bienvenido a\nLas Espadas de Don Ramon',
                color: Colors.green,
                fontWeight: FontWeight.bold,
                size: 25,
              ),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPizza(producto: list))),
                  child: const Text('Ordeenes')),
              spacingheight20,
              TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  hintText: 'Busca tu plato favorito',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.3),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                ),
              ),
              spacingheight20,
              const Category(),
              spacingheight20,
              ...prodcut.map((e) => InkWell(
                    onTap: () {
                      list.add(e);
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPizza(producto: e)));
                    },
                    child: Munus(
                      size: size,
                      url:
                          'https://i.pinimg.com/474x/cc/47/45/cc474537618ae14f3d62ff718641c491.jpg',
                      title: e.descripcin,
                      subTitle:
                          'Elfficia amet in dolor commodo esse sint. Ad aliquip irure in laboris sit consequat aliquip nisi veniam excepteur ipsum fugiat velit. In ad nulla sunt id sit sint aute laboris. Voluptate dolore ut minim cupidatat. Aute mollit ipsum proident ea velit culpa qui. Irure enim ad eiusmod amet Lorem labore.',
                    ),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          ...List.generate(5, (index) {
            List text = [
              ['Entradas', Icons.favorite],
              ['Favoritos', Icons.star_border_outlined],
              ['segundos', Icons.menu_book],
              ['bebidas', Icons.boy_outlined],
              ['postres', Icons.ios_share]
            ];
            return Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange.withOpacity(.1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(text[index][1]),
                  spacingwidth10,
                  Text(text[index][0])
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
