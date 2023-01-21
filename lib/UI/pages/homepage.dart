// ignore_for_file: must_be_immutable

import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/routes/routes.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.userlogin});
  User userlogin;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light); //color de la barra de superior del phone
    //.copyWith( statusBarColor: Colors.redAccent, statusBarBrightness: Brightness.dark ));
    return Scaffold(
        body: Stack(
          children: [
            BackgroundPageWdiget(
              image: const NetworkImage(
                  'https://i.pinimg.com/564x/1f/20/0f/1f200f2f172e42fff38207d656819680.jpg'),
              isvisible: true,
            ),
            _HomeRoles(user: userlogin),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: 2,
          // showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color.fromRGBO(236, 98, 188, 1),
          unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
          backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessible_forward), label: 'User'),
            // BottomNavigationBarItem(icon: Icon(Icons.accessible_forward), label: 'User'),
            // BottomNavigationBarItem(icon: Icon(Icons.accessible_forward), label: 'User'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ));
  }
}

class _HomeRoles extends StatelessWidget {
  _HomeRoles({required this.user});

  User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyleUi(
                fontWeight: FontWeight.bold,
                size: 20,
                text: 'Bienvenido ${user.nombreCompleto}',
                color: Colors.white),
            spacingheight10,
            TextStyleUi(
                fontWeight: FontWeight.normal,
                size: 15,
                text:
                    'Realiza tus actividades de forma rapida y sencilla, consulta tus dudas con el administrador.',
                color: Colors.white.withOpacity(.7)),
            //Card de Modulos

            const Expanded(child: _CardModules()),
          ],
        ),
      ),
    );
  }
}

//Tarjetas de modulos del Home page
class _CardModules extends StatelessWidget {
  const _CardModules({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        ...List.generate(
          pageRoutes.length,
          (index) => CardBlurWidget(
            ruta: pageRoutes[index].page,
            colorblur: const Color.fromRGBO(62, 60, 107, .42),
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.primaries[index + 9],
                    radius: 30,
                    child: pageRoutes[index].icon),
                spacingheight10,
                TextStyleUi(
                    fontWeight: FontWeight.bold,
                    size: 12,
                    text: pageRoutes[index].title,
                    color: Colors.primaries[index + 9])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
