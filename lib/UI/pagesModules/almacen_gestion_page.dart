import 'dart:ui';

import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/UI/widgetModules/widgetmodules.dart';

import 'package:batman_spash_screen/models/user_model.dart';
import 'package:batman_spash_screen/service/user_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlmacenGestionPage extends StatefulWidget {
  const AlmacenGestionPage({super.key});

  @override
  State<AlmacenGestionPage> createState() => _AlmacenGestionPageState();
}

class _AlmacenGestionPageState extends State<AlmacenGestionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool expanded = false;

  double maxheight = 350;

  double minheight = 70;

  User currentUser = User(
      nombreCompleto: '',
      password: '',
      estatus: true,
      calification: 0,
      dni: 0,
      direccion: '',
      telefono: 0,
      role: '',
      image: 'https://i.pinimg.com/564x/78/9f/1d/789f1db8b41720fa905458dceff111f1.jpg',
      cargo: '',
      correo: '',
      genero: '',
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
            BackgroundPageWdiget(
              isvisible: false,
              image: const NetworkImage(
                  'https://i.pinimg.com/564x/0b/59/07/0b5907c1736b2830313bce0820a06888.jpg'), ),
           
            ListView.builder(
              padding: EdgeInsets.only(bottom:size.height * .5),
              itemBuilder: (context, index) {
                final userIo = usuarios[index];

                return GestureDetector(
                  onTap: () => setState(() { currentUser = userIo; }),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: BlurWidget(
                      height: 250,
                      colorblur: Colors.primaries[index].withOpacity(.25), 
                      child: Column(
                        children: [
                          Text(userIo.nombreCompleto,),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage( userIo.image),),
                          Text(userIo.telefono.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: usuarios.length,
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
                        colorblur: Colors.white.withOpacity(.5),
                        height: null,
                        child: Container(
                            decoration: BoxDecoration(
                                // color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(
                                      (lerpDouble(20.0, 20.0, value)!
                                          .toDouble())),
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
          const Icon(Icons.apple),
          CircleAvatar(
            backgroundImage: NetworkImage(currentUser.image),
            radius: 20,
          ),
          const Icon(Icons.apple)
        ],
      );
}
