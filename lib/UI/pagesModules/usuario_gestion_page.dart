import 'dart:ui';


import 'package:batman_spash_screen/UI/pagesModules/pagemodules.dart';
import 'package:batman_spash_screen/UI/widgetModules/widgetmodules.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/service/service.dart';
import 'package:batman_spash_screen/UI/general/colors.dart';


import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UsuariogestionPage extends StatefulWidget {
  const UsuariogestionPage({super.key});

  @override
  State<UsuariogestionPage> createState() => _UsuariogestionPageState();
}

class _UsuariogestionPageState extends State<UsuariogestionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool expanded = false;

  double maxheight = 350;

  double minheight = 70;

  User currentUser = User(
      nombreCompleto: '.....',
      password: '',
      estatus: true,
      calification: 0,
      dni: 0,
      direccion: '',
      telefono: 0,
      role: '',
      image:
          'https://i.pinimg.com/564x/78/9f/1d/789f1db8b41720fa905458dceff111f1.jpg',
      cargo: '',
      correo: '',
      genero: 'masculino',
      apellido: '');

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userList = Provider.of<RecursosProvider>(context);
    final List<User> usuarios = userList.recursoList;

    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double menuwidth = width * .5;


    return Scaffold(
        body: Stack(
          children: [
            //Background de la pagina
            Hero(
              tag: 'logo',
              transitionOnUserGestures: true,
              child: BackgroundPageWdiget(
                isvisible: false,
                image: const AssetImage('assets/cerro_colores.png'),
                isvisibleCircle: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * .43),
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: size.height * .2, top: 150),
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  final userIo = usuarios[index]; //IMPORTANTE

                  return GestureDetector(
                    onTap: () => setState(() {
                      currentUser = userIo;
                    }),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 0),
                      child: Center(
                        child: BlurWidget(
                          height: 60,
                          colorblur: expanded == false ? Colors.primaries[index].withAlpha(1).withOpacity(.08) 
                          : Colors.transparent,
                          child: Stack(
                            children: [
                              FadeOutParticle(            
                                disappear: expanded,
                                child: USerWidgetModuleCard(
                                  userIo: userIo,
                                  index: index,
                                  userlist: userList,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                child: InkWell(
                                    onTap: () {
                                      userList.selectedUser =
                                          userList.recursoList[index].copy();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const UsuarioModule()));
                                    },
                                    child: FadeOutParticle(
                                      disappear: expanded,
                                      child: Container(
                                          height: 65,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(1),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                color: kfont3erColor,
                                                size: 20,
                                              ),
                                              TextStyleUi(
                                                  fontWeight: FontWeight.bold,
                                                  size: 10,
                                                  text: 'Editar',
                                                  color:kfont3erColor)
                                            ],
                                          )),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: BlurWidget(
                  colorblur: Colors.white.withOpacity(.4),
                  height: size.height * .35,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: 40,
                        child: BlurWidget(
                          colorblur: Colors.black.withOpacity(.8),
                          height: null,
                          child: InstaImageViewer(
                            child: Image.network(
                              currentUser.image,
                              height: 300,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20)),
                              color: Colors.black,
                            ),
                            child: TextStyleUi(
                                fontWeight: FontWeight.bold,
                                size: 13,
                                text:
                                    '${currentUser.nombreCompleto} ${currentUser.apellido}',
                                color: Colors.white),
                          )),
                      Positioned(
                        left: 20,
                        top: 10,
                        child: TextStyleUi(
                            fontWeight: FontWeight.bold,
                            size: 20,
                            text: 'Modulo de usuarios',
                            color: kfont3erColor),
                      ),
                      Positioned(
                        top: 0,
                        right: 20,
                        child: MaterialButton(
                          color: kfontSecondaryColor.withOpacity(.8),
                          onPressed: () async {
                            userList.selectedUser = User(
                              nombreCompleto: '',
                              apellido: '',
                              dni: 0,
                              password: '',
                              direccion: 'Av. Ejemplo',
                              telefono: 0,
                              image:
                                  'https://i.pinimg.com/564x/34/cc/de/34ccde761b4737df092c6efec66d035e.jpg', //7pickerFile!.path,
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
                                    builder: (context) =>
                                        const UsuarioModule()));
                            setState(() {});
                          },
                          child: TextStyleUi(
                              fontWeight: FontWeight.normal,
                              size: 14,
                              text: 'nuevo usuario',
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        extendBody: true,
        bottomNavigationBar: GestureDetector(
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
            if (expanded) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          },
          child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                final value =
                    const ElasticInCurve(0.7).transform(_controller.value);
                // final value = _controller.value;
                return Stack(
                  children: [
                    Positioned(
                      bottom: lerpDouble(40, 0, value),
                      left: lerpDouble(width / 2 - menuwidth / 2, 0, value),
                      width: lerpDouble(menuwidth, width, value),
                      height: lerpDouble(minheight, maxheight, value),
                      child: BlurWidget(
                        colorblur: Colors.white.withOpacity(.7),
                        height: null,
                        child: Container(
                            decoration: BoxDecoration(
                                // color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                  (lerpDouble(20.0, 20.0, value)!.toDouble())),
                              bottom: Radius.circular(
                                  (lerpDouble(20.0, 0.0, value)!.toDouble())),
                            )),
                            child: expanded
                                ? _buildExpandedContent()
                                : _buildMenuContent()),
                      ),
                    ),
                  ],
                );
              }),
        ));
  }

  // ignore: unnecessary_null_comparison
  Widget _buildExpandedContent() => currentUser == null
      ? const SizedBox()
      : FittedBox(
          fit: BoxFit.scaleDown,
          child: USerWidgetModules(currentUser: currentUser),
        );

  Widget _buildMenuContent() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            CircleAvatar(
            backgroundColor: Colors.black,
            child: TextStyleUi(
                fontWeight: FontWeight.bold,
                size: 20,
                text: currentUser.nombreCompleto.substring(0, 2),
                color: Colors.white),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(currentUser.image),
            radius: 20,
          ),
        
          CircleAvatar(
              backgroundColor: Colors.black,
              child: currentUser.genero != 'masculino'
                  ? const Icon(
                      Icons.woman,
                      color: Color.fromARGB(255, 241, 130, 167),
                    )
                  : const Icon(
                      Icons.man,
                      color: Color.fromARGB(255, 44, 220, 243),
                    )),
        ],
      );
}
