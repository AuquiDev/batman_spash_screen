// ignore_for_file: must_be_immutable

import 'package:batman_spash_screen/UI/general/spaicing.dart';
import 'package:batman_spash_screen/UI/widget/text_ui_widget.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:flutter/material.dart';

class DetailsPizza extends StatelessWidget {
  DetailsPizza({super.key, required this.producto});
  List<Producto> producto;
  double heightsepared = 300;

  double preciototal = 0;

  @override
  Widget build(BuildContext context) {
    for (Producto ex in producto) {
      preciototal = preciototal + ex.precioUnidad;
    }
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.network(
                'https://i.pinimg.com/474x/ee/b3/ba/eeb3bac1550ef6bbfb6d7a0e670c1e6f.jpg',
                height: heightsepared,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: (heightsepared - 30),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 232, 244, 232),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacingheight100,
                    ...producto.reversed.map(
                      (e) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextStyleUi(
                                  fontWeight: FontWeight.normal,
                                  size: 15,
                                  text: e.descripcin,
                                  color: Colors.black),
                            ),
                            TextStyleUi(
                                fontWeight: FontWeight.normal,
                                size: 15,
                                text: 'S/. ${e.precioUnidad}',
                                color: Colors.black),
                          ],
                        );
                      },
                    ),
                    spacingheight10,
                    divider,
                    TextStyleUi(
                        fontWeight: FontWeight.bold,
                        size: 16,
                        text:
                            'Precio Total:  S/.$preciototal',
                        color: Colors.pink),
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
