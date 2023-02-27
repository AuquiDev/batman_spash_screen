

import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';

import 'package:batman_spash_screen/UI/widgetModules/widgetmodules.dart';

import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/service/service.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ProductoGestionPage extends StatefulWidget {
  const ProductoGestionPage({super.key});

  @override
  State<ProductoGestionPage> createState() => _ProductoGestionPageState();
}

class _ProductoGestionPageState extends State<ProductoGestionPage>
    with SingleTickerProviderStateMixin {
  bool expanded = false;
  Producto currentProduct = Producto(
      fechaRegistro: DateTime.now().toString(),
      categoria: 'categoria',
      descripcin: 'descripcin',
      fabricante: 'fabricante',
      cantdXPaq: 0,
      unidadDeMedida: 'unidadDeMedida',
      entradas: 0,
      salidas: 0,
      existencia: 0,
      precioUnidad: 0.0,
      precioPaquete: 0.0,
      fechaV: DateTime.now().toString(),
      status: true,
      imagen:
          'https://res.cloudinary.com/dw2vwrqem/image/upload/v1675870053/andean%20lodges/logo_1_h7bqim.png',
      comprar: 0,
      inversin: 0,
      proveedor: 'proveedor',
      id: 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final productos = Provider.of<ProductoProvider>(context);
    final listProducto = productos.productoList;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundPageWdiget(
            isvisible: false,
            image: const NetworkImage(
                'https://i.pinimg.com/564x/87/97/51/87975129b406c32a63a984195ecd2953.jpg'),
            isvisibleCircle: false,
          ),
          Positioned(
            left: 10,
            right: 10,
            top: size.height * .4,
            height: size.height * .6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...listProducto.map((e) {
                    final productCopy = e;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: Stack(
                        children: [
                          //Lista de Productos 
                         ProductoWidgetModule(listProducto: e,),                      
                          Positioned(
                            left: 0,
                            right: size.width * .8,
                            height: 100,
                            child: InkWell(
                              onTap: () {
                                currentProduct = productCopy;
                                setState(() {});
                              },
                              child: Container(
                                color: Colors.black12,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  spacingheight100,
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: SizedBox(
              height: size.height * .4,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 40,
                    child: BlurWidget(
                      colorblur: Colors.white.withOpacity(.8),
                      height: null,
                      child: InstaImageViewer(
                        child: Image.network(
                          currentProduct.imagen,
                          height: 300,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BlurWidget(
                        colorblur: Colors.white,
                        height: null,
                        child: Text(
                          '    ${currentProduct.descripcin} ${currentProduct.fabricante}    ',
                        )),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              top: 0,
              child: CustommenuProductos(listProducto: productos))
        ],
      ),
    );
  }

}
