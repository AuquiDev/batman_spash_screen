import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/UI/widgetModules/widgetmodules.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/service/service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductoGestionPage extends StatefulWidget {
  const ProductoGestionPage({super.key});

  @override
  State<ProductoGestionPage> createState() => _ProductoGestionPageState();
}

class _ProductoGestionPageState extends State<ProductoGestionPage> {

  ////////
  final _pageController = PageController(
    viewportFraction: 0.6,
    initialPage: 0
  );

  double paginaActual = 0.0;
  //Escuchar el Scroll del page Controller
  void escuharEcroll(){
      paginaActual = _pageController.page!;
  }

  @override
  void initState() {
    _pageController.addListener(escuharEcroll);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.removeListener(escuharEcroll);
    _pageController.dispose();
    super.dispose();
  }
  /////////

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
      id:' 0'
      );

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

  String copyCategory = 'Aceites y Grasas';

  List<dynamic> mes = [
    ["Enero", 1],
    ["Febrero", 2],
    ["Marzo", 3],
    ["Abril", 4],
    ["Mayo", 5],
    ["Junio", 6],
    ["Julio", 7],
    ["Agosto", 8],
    ["Septiembre", 9],
    ["Octubre", 10],
    ["Noviembre", 11],
    ["Diciembre", 12]
  ];

  List<int> year = [
    DateTime.now().year - 1,
    DateTime.now().year,
    DateTime.now().year + 1,
    DateTime.now().year + 2,
    DateTime.now().year + 3
  ];

  int timeCopy = DateTime.now().month;
  int yearCopy = DateTime.now().year;

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProductoProvider>(context);
    final listProducto = productos.productoList;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kfont3erColor,
        title: isVisible == true
            ? DropdownButtonFormField(
                borderRadius: BorderRadius.circular(20),
                dropdownColor: Colors.white,
                decoration: _decorationDropDow('Seleccione categoría'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isVisible == true ? kfont3erColor : Colors.white,
                ),
                items: categoria.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (value) {
                  isVisible = true;
                  setState(() {
                    copyCategory = value!;
                  });
                },
              )
            : DropdownButtonFormField(
                borderRadius: BorderRadius.circular(20),
                dropdownColor: Colors.white,
                decoration: _decorationDropDow('seleccione el año'),
                items: year
                    .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e.toString())))
                    .toList(),
                onChanged: (value) {
                  isVisible = false;
                  setState(() {
                    yearCopy = value!;
                  });
                },
              ),
       
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.add_business,
                      color: Colors.white,
                    ),
                    Text(
                      'nuevo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
          ),
        ],
      ),
     
      body: Stack(
        children: [
          BackgroundPageWdiget(image: const AssetImage(AssetsData.huampo), isvisible: true),
          ///********************************* */
          
          // PageView.builder(
          //   controller: _pageController,
          //   scrollDirection: Axis.vertical,
          //   itemCount: listProducto.length,
          //   itemBuilder: (context, index) {
          //     final result = paginaActual - index;
          //     final funcionLineal = -0.4 *result +1;
          //     print(result);
          //   return Transform(
          //     transform: Matrix4.identity()
          //     ..setEntry(3, 2, .001),
          //     child: ProductoWidgetModule(listProducto: listProducto[index]));
          // }),


          


          ///********************************* */

          // Lista PRODUCTOS segun categoria
          isVisible == true
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      ...listProducto.map(
                        (e) {
                          // final productCopy = e;
                          if (e.categoria == copyCategory) {
                            return ProductoWidgetModule(
                              listProducto: e,
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                )
              : const SizedBox(),

          //Lista FECHA VENCIMIENTO 
          isVisible == false
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      spacingheight100,
                      ...listProducto.map(
                        (e) {
                          String fechaString = e.fechaV.toString();//creamos una variable String que alamcene la fecha
                          DateTime fecha = DateTime.parse(fechaString);//Convertimos a DateTime
                          if (fecha.month == timeCopy && fecha.year == yearCopy) {
                            return ProductoWidgetModule(
                              listProducto: e,
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          //ROw de categorias
          isVisible == false
              ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(mes.length, (index) {
                      return InkWell(
                          onDoubleTap: () {},
                          onTap: () {
                            int fechaString = mes[index][1];//la fecha que seleccione
                            setState(() {
                              timeCopy = fechaString;
                            });
                          },
                          child: AnimatedContainer(
                            width: mes[index][1] != timeCopy ? 75  :85,
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.fastOutSlowIn,
                            margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 5),
                            decoration: BoxDecoration(
                                color: mes[index][1] != timeCopy
                                    ? Colors.green
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                           
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _texto('${mes[index][0]}', 12, Colors.white),
                                _texto(yearCopy.toString(), 10, Colors.white)
                              ],
                            ),
                          ));
                    })
                  ],
                ),
              )
              : const SizedBox(),
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
           color:kfont3erColor,
        ),

        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            BuscarProducto(listProducto: productos),
            PDFReporteProdcutos(listProducto: productos),
            TextButton(
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    _texto('Compras', 12, Colors.white)
                  ],
                )),
            TextButton(
                onPressed: () {
                  isVisible = false;
                  setState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    Icon(Icons.date_range, color: isVisible == false ? kfontNavPinkcolor: Colors.white,),
                   _texto('Fecha V.', 12, isVisible == false ? kfontNavPinkcolor: Colors.white,)
                  ],
                )),
            TextButton(
                onPressed: () {
                  isVisible = true;
                  setState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    Icon(Icons.category,color: isVisible == true ? kfontNavPinkcolor: Colors.white),
                    _texto('categoría', 12, isVisible == true ? kfontNavPinkcolor: Colors.white)
                  ],
                ))
          ],
        ),
      ),
    );
  }

  InputDecoration _decorationDropDow(String hintText) {
    return   InputDecoration(
    //  prefixIcon:Icon(Icons.keyboard_arrow_down,color:kfont3erColor, ),
     hintText: hintText,
     fillColor: Colors.white, filled: true);
  }


  TextStyleUi _texto(String text, double size, Color color) {
    return TextStyleUi(
                  fontWeight: FontWeight.bold,
                  size: size,
                  text: text,
                  color: color);
  }
}
