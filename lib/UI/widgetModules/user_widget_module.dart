import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:flutter/material.dart';


class USerWidgetModules extends StatelessWidget {
  const USerWidgetModules({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         TextStyleUi(
                fontWeight: FontWeight.bold,
                size: 15,
                text: '${currentUser.nombreCompleto} ${currentUser.apellido}',
                color: Colors.black),
        TextStyleUi(
                fontWeight: FontWeight.bold,
                size: 13,
                text: 'Correo: ${currentUser.correo}',
                color: Colors.black),
        spacingheight20,
        Row(
          children: [
            spacingwidth10,
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(currentUser.image))
              ),
            ),
            spacingwidth30,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyleUi(
                fontWeight: FontWeight.bold,
                size: 13,
                text: 'Telefono: ${currentUser.telefono}',
                color: Colors.black),
                TextStyleUi(
                fontWeight: FontWeight.bold,
                size: 13,
                text: 'DNI: ${currentUser.dni}',
                color: Colors.black),
                TextStyleUi(
                fontWeight: FontWeight.bold,
                size: 13,
                text: 'Contraseña: ${currentUser.password}',
                color: Colors.black),
                TextStyleUi(
                fontWeight: FontWeight.bold,
                size: 13,
                text:currentUser.estatus==true ? 'Estado: ACTIVO' : 'Estado: INACTIVO',
                color: Colors.black),
              ],
            ),
          ],
        ),
        spacingheight20,
       
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const Icon(Icons.edit),
            spacingwidth30,
            const Icon(Icons.camera_enhance),
            spacingwidth30,
            const Icon(Icons.photo)
          ],
        )
      ],
    );
  }
}
