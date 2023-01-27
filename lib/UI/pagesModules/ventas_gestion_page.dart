
import 'package:batman_spash_screen/UI/widget/card_blur_wdiget.dart';
import 'package:batman_spash_screen/UI/widget/text_ui_widget.dart';
import 'package:batman_spash_screen/service/user_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart' as vector;

class VentasWidgetPage extends StatelessWidget {
  const VentasWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user  = Provider.of<RecursosProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: SliverAppBAr(),
            pinned: true,
          ), //HEader

            SliverToBoxAdapter(
            child: BlurWidget(
                height: 900,
                colorblur: Colors.white.withOpacity(.3),
                child: Column(
                  children: [
                    ...List.generate(user.recursoList.length, (index) => Text(user.recursoList[index].nombreCompleto),)
                  ],
                )
            ),
            
          ),
          // UsuariosFOrm()
        ],
      ),
    );
  }
}

const maxHeight = 350.0;
const minHeight = 120.0;

const maxImageSize = 150.0;
const minImageSize = 50.0;

const maxTitleSize = 25.0;
const maxSubTitleSize = 18.0;

const minTitleSize = 20.0;
const minSubTitleSize = 1.0;

class SliverAppBAr extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = MediaQuery.of(context).size;
    final percent = shrinkOffset / maxHeight;
    final currentImagesize = (maxHeight * (1-percent)).clamp(minImageSize, maxImageSize);
    return Container(
      color: Colors.blueGrey,
      child: Stack(
        children: [
          Positioned(
           top: 60,
            left: ((size.width*.3) + (60*percent)),
            height: maxImageSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyleUi(
                    fontWeight: FontWeight.bold,
                    size: (maxTitleSize * (1-percent)).clamp(minTitleSize, maxTitleSize),
                    text: 'Sliver AppBar',
                    color: Colors.black),
                TextStyleUi(
                    fontWeight: FontWeight.bold,
                    size: (maxTitleSize * (1-percent)).clamp(minSubTitleSize, maxSubTitleSize),
                    text: 'SubTile Sliver AppBar',
                    color: Colors.black.withOpacity(.5)),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              left: (150 * (1- percent)).clamp(33, 150),
              height: currentImagesize,
              child: Transform.rotate(angle: vector.radians(360*percent),
              child: Image.network('https://i.pinimg.com/564x/05/24/6f/05246f8b0989eb16e2b0ca9810e3a208.jpg'))),
          Positioned(
              bottom: 20,
              left: 35,
              height: currentImagesize,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network('https://i.pinimg.com/564x/52/cc/56/52cc56c44094ab87417a3be4c4958555.jpg'))),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
