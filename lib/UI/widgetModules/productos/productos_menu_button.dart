import 'dart:io';

import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/UI/widgetModules/widgetmodules.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/service/service.dart';
import 'package:bubble_lens/bubble_lens.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:search_page/search_page.dart';
//PDF
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:flutter/material.dart';

class CustommenuProductos extends StatelessWidget {
  const CustommenuProductos({
    Key? key,
    required this.listProducto,
  }) : super(key: key);

  final ProductoProvider listProducto;

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      toggleButtonIconColor: Colors.redAccent,
      toggleButtonPadding: 15,
      toggleButtonAnimatedIconData: AnimatedIcons.list_view,
      toggleButtonBoxShadow: const [
        BoxShadow(offset: Offset.zero, color: Colors.white, blurRadius: 2)
      ],
      animationDuration: const Duration(microseconds: 1000),
      toggleButtonColor: Colors.black,
      alignment: Alignment.bottomCenter,
      curve: Curves.bounceInOut,
      items: [
        _Circularmenuitem(
          Icons.add,
          () {
            Navigator.pop(context);
          },
        ),
        _Circularmenuitem(
          Icons.picture_as_pdf_sharp, //PDF GENERATE
          () async {
            ByteData byteData = await rootBundle.load('assets/logo.png');
            Uint8List imagenBytes = byteData.buffer.asUint8List();

            pw.Document pdf = pw.Document();

            pdf.addPage(pw.MultiPage(
                // margin: pw.EdgeInsets.all(20),
                // maxPages: 100,
                header: (context) {
                  return pw.Column(
                    children: [
                      pw.Table(children: [
                        pw.TableRow(children: [
                          _container(
                            120,
                            80,
                            pw.Column(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Image(pw.MemoryImage(imagenBytes)),
                                ]),
                          ),
                          _container(
                            120 * 3,
                            80,
                            pw.Column(children: [
                              _container(
                                  120 * 3,
                                  20,
                                  pw.Text(
                                      'Gestion de procesos de Logistica Andean Lodges',
                                      textAlign: pw.TextAlign.center)),
                              _container(
                                  120 * 3,
                                  35,
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceEvenly,
                                      children: [
                                        pw.Text(
                                            'Fecha de reporte: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.Text('Codigo: F00236714',
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight: pw.FontWeight.bold))
                                      ])),
                              _container(
                                  120 * 3,
                                  25,
                                  pw.Center(
                                      child: pw.Text(' Invnetario de Productos',
                                          textAlign: pw.TextAlign.center)))
                            ]),
                          )
                        ])
                      ]),
                      pw.Row(
                        children: [
                          _container(
                            120 * 3,
                            35,
                            pw.Text(
                                'Reporte de Control de Entradas y Salidas de Productos y Abastecimientos',
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    fontSize: 13,
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                          _container(
                              120,
                              35,
                              pw.Column(children: [
                                _container(
                                  120,
                                  12,
                                  pw.Text(
                                      'Fecha: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ),
                                _container(
                                  120,
                                  12,
                                  pw.Text('Version: 001',
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ),
                                _container(
                                  120,
                                  11,
                                  pw.Text('Version: 001',
                                      style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.normal)),
                                ),
                              ]))
                        ],
                      )
                    ],
                  );
                },
                footer: (context) {
                  List<String> footer = [
                    ' Entrego : ',
                    ' Recibio : ',
                    ' Aprobo : ',
                    ' Codigo : '
                  ];
                  return pw.Row(children: [
                    ...List.generate(4,
                        (index) => _container(120, 50, pw.Text(footer[index])))
                  ]);
                },
                pageFormat: PdfPageFormat.a4,
                build: (pw.Context context) {
                  List<dynamic> headerProduct = [
                    [' Producto', 5],
                    [' Marca', 5],
                    ['Cantidad en stock', 8],
                    ['Precio unitario',7],
                    ['Fecha de vencimiento', 6],
                    ['Requerimiento', 6]
                  ];
                  return [
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 20),
                        child: pw.Column(children: [
                          _container(
                              480,
                              20,
                              pw.Center(
                                child: pw.Text(
                                    'Reporte de existencias de productos',
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(
                                        fontSize: 13,
                                        fontWeight: pw.FontWeight.bold)),
                              )),
                          pw.Table(children: [
                            pw.TableRow(children: [
                              ...List.generate(
                                6,
                                (index) => _container(
                                  480 / headerProduct[index][1],
                                  30,
                                  pw.Text(headerProduct[index][0].toString(),
                                      textAlign: pw.TextAlign.center,
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          fontWeight: pw.FontWeight.bold)),
                                ),
                              )
                            ]),
                          ]),
                          //  ...List.generate(listProducto.productoList.length, (index) =>
                          ...listProducto.productoList
                              .map((e) => pw.Row(children: [
                                    _container(
                                      480 / 5,
                                      10,
                                      pw.Text( ' ${e.descripcin}',
                                          textAlign: pw.TextAlign.left,
                                          style: pw.TextStyle(
                                              fontSize: 7,
                                              fontWeight: pw.FontWeight.normal)),
                                    ),
                                    _container(
                                      480 / 5,
                                      10,
                                      pw.Text(' ${e.fabricante}',
                                          textAlign: pw.TextAlign.left,
                                          style: pw.TextStyle(
                                              fontSize: 7,
                                              fontWeight: pw.FontWeight.normal)),
                                    ),
                                    _container(
                                      480 / 8,
                                      10,
                                      pw.Text(e.existencia.toString(),
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.normal)),
                                    ),
                                    _container(
                                      480 / 7,
                                      10,
                                      pw.Text('  s/.${e.precioUnidad}',
                                          textAlign: pw.TextAlign.left,
                                          style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.normal)),
                                    ),
                                    _container(
                                      480 / 6,
                                      10,
                                      pw.Text(e.fechaV,
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.normal)),
                                    ),
                                    _container(
                                      480 / 6,
                                      10,
                                      pw.Text( e.existencia <= 20 ? 'Comprar': 'Abastece',
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.normal,
                                              color: e.existencia <= 20 ? PdfColor.fromRYB(1, 0, 0) : PdfColor.fromRYB(1, 1, 1))),
                                    ),
                                  ])),
                        ]))
                  ];
                }));

            Uint8List bytes = await pdf.save();
            Directory directory = await getApplicationDocumentsDirectory();
            File filePdf = File("${directory.path}/productos.pdf");
            filePdf.writeAsBytes(bytes);
            OpenFilex.open(filePdf.path);
            // print(directory.path);
            // print(bytes);
          },
        ),
        _Circularmenuitem(
          Icons.search, //BUSQUEDA DATOS
          () {
            showSearch(
              context: context,
              delegate: SearchPage<Producto>(
                barTheme: ThemeData.light().copyWith(
                    appBarTheme:
                        const AppBarTheme(color: Colors.black, elevation: 0)),
                searchStyle: const TextStyle(color: Colors.white),
                suggestion: const Center(
                    child: Icon(
                  Icons.search,
                  size: 90,
                )),
                failure: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextStyleUi(
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        size: 15,
                        text:
                            'No hemos encontrado ningún producto que coincida con su búsqueda. ¿Por qué no intenta buscar algo diferente?',
                        color: Colors.black),
                  ),
                ),
                items: listProducto.productoList,
                filter: (value) => [value.descripcin, value.categoria],
                builder: (value) => Container(
                  color: Colors.black.withOpacity(.5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 1.0, horizontal: 5),
                  child: ProductoWidgetModule(listProducto: value),
                ),
              ),
            );
          },
        ),
        _Circularmenuitem(
          Icons.blur_circular,
          () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BurbujasProductos(
                          productos: listProducto,
                        )));
          },
        )
      ],
    );
  }

  pw.Container _container(double width, double height, pw.Widget child) {
    return pw.Container(
      width: width,
      height: height,
      decoration: pw.BoxDecoration(
        border: pw.Border.all(style: pw.BorderStyle.solid),
      ),
      child: child,
    );
  }

  // ignore: non_constant_identifier_names
  CircularMenuItem _Circularmenuitem(IconData icon, Function ontap) {
    return CircularMenuItem(
      color: Colors.black,
      boxShadow: const [
        BoxShadow(offset: Offset.zero, color: Colors.white, blurRadius: 2)
      ],
      onTap: () {
        ontap();
      },
      icon: icon,
    );
  }
}

// ignore: must_be_immutable
class BurbujasProductos extends StatelessWidget {
  BurbujasProductos({super.key, required this.productos});
  ProductoProvider productos;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(254, 124, 77, 15),
      child: BubbleLens(
        size: 180,
        height: MediaQuery.of(context).size.height,
        widgets: [
          ...productos.productoList.map((e) => Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white.withOpacity(.6),
              child: InstaImageViewer(child: Image.network(e.imagen))))
        ],
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
