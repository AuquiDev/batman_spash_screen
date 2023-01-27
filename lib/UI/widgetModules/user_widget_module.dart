import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/service/user_provider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class USerWidgetModuleCard extends StatefulWidget {
  USerWidgetModuleCard(
      {Key? key,
      required this.userIo,
      required this.index,
      required this.userlist})
      : super(key: key);

  final User userIo;
  int index;
  RecursosProvider userlist;

  @override
  State<USerWidgetModuleCard> createState() => _USerWidgetModuleCardState();
}

class _USerWidgetModuleCardState extends State<USerWidgetModuleCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Positioned(
          left: 40,
          right: 0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:widget.userIo.estatus == true ? Colors.primaries[widget.index].withOpacity(.4) : Colors.redAccent,
              child: widget.userIo.estatus == true
                  ? TextStyleUi(fontWeight: FontWeight.bold, size: 16,
                   text: widget.userIo.nombreCompleto.substring(0, 2), color: Colors.white)
                  : const Icon(Icons.block,color: Colors.white,),
            ),
            title: TextStyleUi(
                fontWeight: FontWeight.bold,
                size: 15,
                text:
                    '${widget.userIo.nombreCompleto} ${widget.userIo.apellido}',
                color: Colors.white),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 TextStyleUi(
                    fontWeight: FontWeight.normal,
                    size: 14,
                    text: 'Rol : ${widget.userIo.role}' ,
                    color: Colors.white),
                TextStyleUi(
                    fontWeight: FontWeight.normal,
                    size: 14,
                    text: widget.userIo.estatus == true ? 'Estado: ACTIVO' : 'Estado: INACTIVO',
                    color: Colors.white),
               
              ],
            ),
            trailing: SizedBox(
              width: 30,
              child: CheckboxListTile(
                side: const BorderSide(
                    color: Colors.white,
                    strokeAlign: StrokeAlign.center,
                    width: 3),
                activeColor: Colors.green,
                checkColor: Colors.white,
                value: widget.userIo.estatus,
                onChanged: (value) {
                  widget.userIo.estatus = value!;
                  setState(() {});
                  // print('Estatus: ${widget.userIo.estatus}');
                  widget.userlist.saveOrCreateProduct(widget.userIo);
                },
                selected: isChecked,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
//CustonNavigatorBar

class USerWidgetModules extends StatelessWidget {
  const USerWidgetModules({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.white.withOpacity(.5),
          child: Icon(
            Icons.close,
            color: Colors.black.withOpacity(.8),
            size: 12,
          ),
        ),
        Column(
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
                          image: NetworkImage(currentUser.image))),
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
                        text: currentUser.estatus == true
                            ? 'Estado: ACTIVO'
                            : 'Estado: INACTIVO',
                        color: Colors.black),
                  ],
                ),
              ],
            ),
            spacingheight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.edit),
                spacingwidth30,
                const Icon(Icons.camera_enhance),
                spacingwidth30,
                const Icon(Icons.photo)
              ],
            )
          ],
        ),
      ],
    );
  }
}
