import 'dart:math';

import 'package:batman_spash_screen/UI/general/logo_assets.dart';
import 'package:batman_spash_screen/UI/general/spaicing.dart';
import 'package:batman_spash_screen/UI/pagesModules/pagemodules.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/service/service.dart';
import 'package:batman_spash_screen/UI/general/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UsuariogestionPage extends StatefulWidget {
  const UsuariogestionPage({super.key});

  @override
  State<UsuariogestionPage> createState() => _UsuariogestionPageState();
}

class _UsuariogestionPageState extends State<UsuariogestionPage> {
  User currentUser = User(
    nombreCompleto: 'Nombre',
    apellido: 'apellido',
    password: '',
    estatus: true,
    calification: 0,
    dni: 10000000,
    direccion: '',
    telefono: 0,
    role: '',
    image:
        'https://res.cloudinary.com/dw2vwrqem/image/upload/v1675870053/andean%20lodges/logo_1_h7bqim.png',
    cargo: '',
    correo: 'correo electrónico',
    genero: 'genero',
  );

  double position = 0.0;
  @override
  Widget build(BuildContext context) {
    final userList = Provider.of<RecursosProvider>(context);
    final List<User> usuarios = userList.recursoList;

    // final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          leading: BackButton(
            color: kfont3erColor,
          ),
          title: TextStyleUi(
              fontWeight: FontWeight.bold,
              size: 18,
              text: 'Gestionar usuarios',
              color: kfont3erColor),
          actions: [
            InkWell(
              onTap: () async {
                userList.selectedUser = User(
                  nombreCompleto: '',
                  apellido: '',
                  dni: 0,
                  password: '',
                  direccion: 'Av. Ejemplo',
                  telefono: 0,
                  image:
                      'https://res.cloudinary.com/dw2vwrqem/image/upload/v1675870053/andean%20lodges/logo_1_h7bqim.png', //7pickerFile!.path,
                  role: 'cliente',
                  cargo: 'cliente',
                  correo: 'example@gmail.com',
                  genero: 'masculino',
                  estatus: true,
                  calification: 1,
                );

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsuarioModule()));
                setState(() {});
              },
              child: BlurWidget(
                colorblur: kfont3erColor,
                height: null,
                child: Row(
                  children: [
                    spacingwidth10,
                    const Icon(
                      Icons.add_reaction_sharp,
                      size: 20,
                      color: Colors.white,
                    ),
                    spacingwidth10,
                    TextStyleUi(
                        fontWeight: FontWeight.normal,
                        size: 14,
                        text: 'Nuevo',
                        color: Colors.white),
                    spacingwidth10
                  ],
                ),
              ),
            )
          ]),

      body: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 1000),
          tween: Tween<double>(begin: 1.1, end: position),
          curve: Curves.fastOutSlowIn,
          builder: (BuildContext context, double value, Widget? child) {
            return Stack(
              children: [
                BackgroundPageWdiget(
                  isvisible: false,
                  image: NetworkImage(currentUser.image),
                  widget: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SingleChildScrollView(
                      child: BlurWidget(
                        colorblur: null,
                        height: null,
                        child: Column(
                          children: [
                            spacingheight100,
                            spacingheight100,
                            ...List.generate(usuarios.length, (index) {
                              final userIo = usuarios[index]; //IMPORTANTE
                              return GestureDetector(
                                onTap: () => setState(() {
                                  if (position == 0) {
                                    position = 1;
                                    currentUser = userIo;
                                  } else {
                                    position = 0;
                                    currentUser = userIo;
                                  }
                                }),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: InkWell(
                                            onTap: () {
                                              userList.selectedUser = userList
                                                  .recursoList[index]
                                                  .copy();

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const UsuarioModule()));
                                            },
                                            child: SvgPicture.asset(
                                                AssetsDataSVG.editar)),
                                      ),
                                      title: TextStyleUi(
                                          fontWeight: FontWeight.bold,
                                          size: 16,
                                          text:
                                              '${usuarios[index].nombreCompleto}  ${usuarios[index].apellido}',
                                          color: Colors.white),
                                      subtitle: TextStyleUi(
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.normal,
                                        size: 15,
                                        text: usuarios[index].estatus
                                            ? 'activo'
                                            : 'inactiva'.toUpperCase(),
                                        color: usuarios[index].estatus
                                            ? Colors.white
                                            : Colors.pinkAccent,
                                      ),
                                      trailing: Switch.adaptive(
                                        inactiveTrackColor:
                                            Colors.black.withOpacity(.3),
                                        value: usuarios[index].estatus,
                                        onChanged: (value) {
                                          usuarios[index].estatus = value;
                                          setState(() {});
                                          userList.saveOrCreateProduct(
                                              usuarios[index]);
                                        },
                                      ),
                                    ),
                                    divider
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -5,
                  left: -5,
                  child: BlurWidget(
                    colorblur: Colors.white.withOpacity(.7),
                    height: 220,
                    // width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _currentuser(Icons.supervised_user_circle,
                                '${currentUser.nombreCompleto} ${currentUser.apellido}'),
                            _currentuser(Icons.email, currentUser.correo),
                            _currentuser(Icons.stay_primary_landscape_rounded,
                                'DNI : ${currentUser.dni}'),
                            _currentuser(Icons.remove_red_eye,
                                'Contraseña : ${currentUser.password}'),
                            _currentuser(Icons.phone,
                                'Teléfono : ${currentUser.telefono}'),
                            _text(
                                '| Rol - ${currentUser.role} | • | ${currentUser.cargo} |'),
                            _text(
                                '| ${currentUser.genero} | • | ${currentUser.estatus} | • | ${currentUser.calification} h. |'),
                          ],
                        ),
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, .001)
                            ..rotateY(3 * pi * value)
                            ..rotateZ(value)
                            ..rotateX((pi / 8)),
                          child: InstaImageViewer(
                            child: Image.network(
                              currentUser.image,
                              height:position ==1.0 ?  value* 200 : 200,
                              width: 120,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
      // extendBody: true,
    );
  }

  TextStyleUi _text(String text) {
    return TextStyleUi(
        textAlign: TextAlign.center,
        textOverflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.bold,
        size: 12,
        text: text,
        color: kfont3erColor);
  }

  Padding _currentuser(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: kfont3erColor,
            size: 15,
          ),
          spacingwidth10,
          TextStyleUi(
              textOverflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
              size: 12,
              text: text,
              color: kfont3erColor)
        ],
      ),
    );
  }
}
