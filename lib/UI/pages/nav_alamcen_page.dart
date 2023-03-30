// ignore_for_file: non_constant_identifier_names

import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/routes/routes.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavAlmacenPage extends StatefulWidget {
  const NavAlmacenPage({super.key});

  @override
  State<NavAlmacenPage> createState() => _NavAlmacenPageState();
}

class _NavAlmacenPageState extends State<NavAlmacenPage>
    with SingleTickerProviderStateMixin {
  int position = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<Color> colors = [Colors.brown, Colors.cyan, Colors.orange];
  double valor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Image.asset(
              AssetsData.andeanLodges,
              color: colors[position],
            ),
          ],
          title: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 1200),
            tween: Tween(begin: 0, end: 1),
            curve: Curves.fastOutSlowIn, // Curves.bounceOut,
            builder: (BuildContext context, value, _) {
              valor = value;
              return Transform.translate(
                offset: Offset((-100.0 * value) + 100, 0),
                child: Opacity(
                  opacity: (value).clamp(0.0, 1.0),
                  child: TextStyleUi(
                    text: 'Almacén',
                    color: kfont3erColor,
                    fontWeight: FontWeight.bold,
                    size: 25,
                  ),
                ),
              );
            },
          ),
          bottom: TabBar(
            indicatorColor: kfont3erColor,
            unselectedLabelColor: kfont3erColor,
            labelColor: kfontNavPinkcolor,
            onTap: (value) {
              position = value;
              setState(() {});
            },
            tabs: [
              Tab(
                text: 'Equipos',
                icon: _Svg(AssetsDataSVG.almacen, 0),
              ),
              Tab(
                text: 'Productos',
                icon: _Svg(AssetsDataSVG.tenedor, 1),
              ),
              Tab(
                text: 'Medicamentos',
                icon: _Svg(AssetsDataSVG.categoria, 2),
              ),
            ],
            controller: _tabController,
          ),
        ),
        body: TweenAnimationBuilder<double>(
          tween: Tween(begin: 1, end: 0),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastOutSlowIn, //Curves.elasticOut,
          builder: (context, value, _) {
            return Transform.translate(
              offset: Offset(100 * value, -100 * value),
              child: Opacity(
                opacity: (1 - value).clamp(0.0, 1.0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    EquiposAlmacen(
                      valor: valor,
                    ),
                    EquiposAlmacen(
                      valor: valor,
                    ),
                    EquiposAlmacen(
                      valor: valor,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  SvgPicture _Svg(String svgImage, int positionElement) => SvgPicture.asset(
        svgImage,
        // ignore: deprecated_member_use
        color: position == positionElement
            ? kfontNavPinkcolor
            : kfontNavBackgroundColor,
      );
}

// ignore: must_be_immutable
class EquiposAlmacen extends StatelessWidget {
  EquiposAlmacen({super.key, required this.valor});
  double valor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         spacingheight100,

          ...List.generate(
            pageRoutesAlmacen.length,
            (index) => GestureDetector(
              child: ExpansionTileCard(
                initialPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                paddingCurve: Curves.elasticInOut,
                finalPadding: const EdgeInsets.all(20),
                initialElevation: 2,
                shadowColor: kfont3erColor,
                leading: Transform.rotate(
                  angle: 360 * valor,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(
                      'https://res.cloudinary.com/dw2vwrqem/image/upload/v1677265179/png-clipart-graphics-gear-computer-icons-technical-tools-blue-angle-removebg-preview_cjotij.png',
                      // color: kfont3erColor,
                    ),
                  ),
                ),
                title: TextStyleUi(
                  fontWeight: FontWeight.normal,
                  size: 18,
                  text: pageRoutesAlmacen[index].title,
                  color: kfont3erColor,
                ),
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: kfont3erColor,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: pageRoutesAlmacen[index].image,
                                fit: BoxFit.cover)),
                      ),
                      BlurWidget(
                        colorblur: Colors.white24,
                        height: 100,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        pageRoutesAlmacen[index].page));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Comenzar',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.wysiwyg_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
