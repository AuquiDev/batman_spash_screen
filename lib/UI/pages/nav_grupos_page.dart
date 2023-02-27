import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/routes/routes.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key, this.userlogin,required this.listUsers});
  List<User> listUsers;
  User? userlogin;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyleUi(
                    fontWeight: FontWeight.bold,
                    size: 10,
                    text: '${userlogin!.nombreCompleto} ${listUsers[4].nombreCompleto}',
                    color: Colors.red),
                //Card de Modulos
                spacingheight50,
                Expanded(child: CardModules()),
              ],
            ),
          ),
        )
      ],
    );
  }
}

//Tarjetas de modulos del Home page
// ignore: must_be_immutable
class CardModules extends StatelessWidget {
  CardModules({
    Key? key,
    this.userLogin,
  }) : super(key: key);

  User? userLogin;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        ...List.generate(
          pageRoutes.length,
          (index) => CardBlurWidget(
            ruta: pageRoutes[index].page,
            colorblur: const Color.fromRGBO(55, 57, 84, .3),
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor:
                        Colors.primaries[index + 5].withOpacity(.3),
                    radius: 45,
                    child: pageRoutes[index].icon),
                spacingheight10,
                TextStyleUi(
                    fontWeight: FontWeight.bold,
                    size: 13,
                    text: pageRoutes[index].title,
                    color: Colors.white)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
