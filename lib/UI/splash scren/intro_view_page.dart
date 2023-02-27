import 'package:batman_spash_screen/UI/general/logo_assets.dart';
import 'package:batman_spash_screen/UI/pages/login_page.dart';
import 'package:batman_spash_screen/UI/widget/background_page_widget.dart';
import 'package:batman_spash_screen/UI/widget/card_blur_wdiget.dart';
import 'package:batman_spash_screen/UI/widget/text_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class IntroViewsPage extends StatefulWidget {
  const IntroViewsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<IntroViewsPage> createState() => _IntroViewsPageState();
}

class _IntroViewsPageState extends State<IntroViewsPage> {
  List text = [
    [Colors.pinkAccent, const AssetImage(AssetsData.chillca)],
    [ const Color.fromARGB(255, 52, 202, 239), const AssetImage(AssetsData.machu)],
    [const Color.fromARGB(255, 214, 238, 154), const AssetImage(AssetsData.ananta)],
    [Colors.orange, const AssetImage(AssetsData.huampo)],
  ];

  int e = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'logo',
            transitionOnUserGestures: true,
            child: BackgroundPageWdiget(
                image: const AssetImage('assets/cerro_colores.png'),
                isvisible: false),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const BlurWidget(
                height: null, colorblur: Colors.white10, child: SizedBox()),
          ),
          IntroductionScreen(
            pages: [
              PageViewModel(
                // useRowInLandscape: true,
                title:
                    "Optimizamos tus procesos de compras e inventario para tu negocio.",
                bodyWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Text(
                        'Haz de la logística una tarea sencilla\n con nuestra aplicación.')
                  ],
                ),
                decoration: _decoration(),
                image: Lottie.asset(
                  AssetsDataLoties.intro1,
                  fit: BoxFit.cover,
                ),
              ),
              PageViewModel(
                title: "Ahorra tiempo y dinero.",
                body:
                    "Maximiza tu productividad y ahorra tiempo con nuestra aplicación de logística.",
                image: Lottie.asset(AssetsDataLoties.intro3),
                decoration: _decoration(),
              ),
              PageViewModel(
                  title: "Mejora tu eficiencia de compras e inventario.",
                  body:
                      "Descubre cómo nuestra aplicación te ayudará a simplificar tus procesos.",
                  image: Lottie.asset(AssetsDataLoties.intro2),
                  decoration: _decoration()),
              PageViewModel(
                  title: "Mejora tu eficiencia de compras e inventario.",
                  body:
                      "Descubre cómo nuestra aplicación te ayudará a simplificar tus procesos.",
                  image: Lottie.asset(AssetsDataLoties.intro4),
                  decoration: _decoration())
            ],
            onChange: (value) {
              setState(() {
                e = value;
              });
            },
            showNextButton: true,
            showBackButton: true,
            done: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _Text('Comenzar')),
            next: _Text('Siguiente'),
            back: _Text('Atras'),
            globalBackgroundColor: Colors.transparent.withOpacity(.2),
            dotsDecorator: const DotsDecorator(color: Colors.white),
            globalFooter: Container(
              margin: const EdgeInsets.only(bottom: 0, left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: Offset.zero,
                    color: text[e][0].withOpacity(.2),
                    blurRadius: 300)
              ], image: DecorationImage(fit: BoxFit.cover, image: text[e][1])),
            ),
            isTopSafeArea: true,
            onDone: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TextStyleUi _Text(String text) => TextStyleUi(
      textAlign: TextAlign.center,
      maxLines: 2,
      fontWeight: FontWeight.bold,
      size: 15,
      text: text,
      color: Colors.white);

  PageDecoration _decoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
          color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 17.0, color: Colors.white),
    );
  }
}
