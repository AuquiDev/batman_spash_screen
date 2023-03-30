import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/models/producto_model.dart';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import '../../general/general.dart';

// ignore: must_be_immutable
class ProductoWidgetModule extends StatelessWidget {
  ProductoWidgetModule({super.key, required this.listProducto});
  Producto listProducto;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      initialElevation: 5,
      // baseColor: kfont3erColor.withOpacity(.5),
      initialPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      trailing:  TextStyleUi(
        textAlign: TextAlign.end,
        color:Colors.black54,
        fontWeight: FontWeight.bold,
        size: 10,
        text: '${listProducto.fechaV}\nStock : ${listProducto.existencia}',
      ),
      elevation: 10,
      title: TextStyleUi(
        color: listProducto.existencia > 15 ? Colors.black54 : Colors.redAccent,
        fontWeight: FontWeight.bold,
        size: 15,
        text: listProducto.descripcin,
      ),
      subtitle: TextStyleUi(
          fontWeight: FontWeight.bold,
          size: 15,
          text: listProducto.categoria,
          color: Colors.black),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.network(listProducto.imagen),
      ),
      turnsCurve: Curves.easeInCirc,
      children: [
        divider,
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _textoexpanded('Fabricante :'),
                        _textoexpanded('Cantidad Paquete :'),
                        _textoexpanded('Unid. Medida :'),
                        _textoexpanded('Existencia :'),
                        _textoexpanded('Precio Unid. :'),
                        _textoexpanded('Precio Paquete :'),
                        _textoexpanded('Fecha Vencimiento :'),
                        _textoexpanded('estado :'),
                        _textoexpanded('Comprar :'),
                        _textoexpanded('Inversión: '),
                        _textoexpanded('Proveedor: '),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _textexpandedData(listProducto.fabricante),
                        _textexpandedData(listProducto.cantdXPaq.toString()),
                        _textexpandedData(listProducto.unidadDeMedida),
                        TextStyleUi(
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.normal,
                            size:listProducto.existencia < 20 ? 16 : 13,
                            text: listProducto.existencia.toString(),
                            color:listProducto.existencia > 15 ? Colors.black54 : Colors.redAccent,),
                        _textexpandedData(
                            'S/.${listProducto.precioUnidad.ceilToDouble()}'),
                        _textexpandedData(
                            'S/.${listProducto.precioPaquete.ceilToDouble()}'),
                        _textexpandedData(listProducto.fechaV.toString()),
                        _textexpandedData(listProducto.status == true
                            ? 'ABASTECE'
                            : 'AGOTADO'),
                        _textexpandedData(listProducto.comprar.toString()),
                        _textexpandedData(
                            'S/.${listProducto.inversin.ceilToDouble()}'),
                        _textexpandedData(listProducto.proveedor),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                // userList.selectedUser =
                //     userList.recursoList[index].copy();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             const UsuarioModule()));
              },
              child: Column(
                children: const [
                  Icon(Icons.edit_square),
                  Text('Editar'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Column(
                children: const [
                  Icon(Icons.image),
                  Text('Galeria'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Column(
                children: const [
                  Icon(Icons.camera_alt),
                  Text('Camara'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  TextStyleUi _textexpandedData(String text) => TextStyleUi(
      textOverflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      size: 13,
      text: text,
      color: Colors.black.withOpacity(.9));

  TextStyleUi _textoexpanded(String text) => TextStyleUi(
      textOverflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      size: 13,
      text: text.toUpperCase(),
      color: Colors.black);
}
