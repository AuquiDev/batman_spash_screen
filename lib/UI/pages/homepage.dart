// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:batman_spash_screen/UI/general/general.dart';

import 'package:batman_spash_screen/UI/pages/pages.dart';


import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/service/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../Xprueba borrar/prueba category.dart';
import '../splash scren/intro_view_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.userlogin,required this.listUsers,required this.index});
  User userlogin;
  RecursosProvider listUsers;
  int index;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navgacion = 4;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
   
    List<Widget> rute = [
      Home(
        userlogin: widget.userlogin, listUsers: widget.listUsers.recursoList,
      ),
      const NavAlmacenPage(),
      const PruebaCategory(),
      const IntroViewsPage(),
      NavPerfilPage(listusers: widget.listUsers, index: widget.index,)
    ];

    return Scaffold(
        body: rute[navgacion],
        bottomNavigationBar: Container(
          decoration:  BoxDecoration(
              color: kfont3erColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: navgacion,
            onTap: (value) {
              navgacion = value;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: kfontNavTealcolor,
            selectedItemColor: kfontNavPinkcolor,
            backgroundColor: Colors.transparent,
            items: [
              BottonNav('Grupos',AssetsDataSVG.home,0),
              BottonNav('Almacén',AssetsDataSVG.almacenn, 1),
              BottonNav('Compras',AssetsDataSVG.compras, 2),
              BottonNav('Ajustes',AssetsDataSVG.configuracion, 3),
              BottonNav('Perfil',AssetsDataSVG.user, 4)
            ],
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  BottomNavigationBarItem BottonNav(String textNav,String svg, int position) => 
  BottomNavigationBarItem( 
    icon: SvgPicture.asset( svg,
        color: navgacion != position
            ? kfontNavTealcolor
            : kfontNavPinkcolor,
      ), label: textNav);
}

