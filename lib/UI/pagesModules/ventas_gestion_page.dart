// ignore_for_file: avoid_print

import 'package:batman_spash_screen/UI/general/spaicing.dart';
import 'package:batman_spash_screen/UI/pagesModules/usuario_gestion_page.dart';
import 'package:batman_spash_screen/UI/widget/card_blur_wdiget.dart';
import 'package:batman_spash_screen/UI/widget/text_ui_widget.dart';
import 'package:batman_spash_screen/models/user_model.dart';
import 'package:batman_spash_screen/service/user_provider.dart';
import 'package:bubble_lens/bubble_lens.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:fade_out_particle/fade_out_particle.dart';

import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import 'package:snappable_thanos/snappable_thanos.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart' as vector;

class VentasWidgetPage extends StatefulWidget {
  const VentasWidgetPage({super.key});

  @override
  State<VentasWidgetPage> createState() => _VentasWidgetPageState();
}

class _VentasWidgetPageState extends State<VentasWidgetPage> {
  bool isparticle = false;
  final key = GlobalKey<SnappableState>();

  final _scrollController = FixedExtentScrollController();
  static const double _itemHeight = 60;
  static const int _itemCount = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<RecursosProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: SliverAppBAr(),
            pinned: true,
          ), //HEader

          SliverToBoxAdapter(
            child: Column(
              children: [
                FadeOutParticle(
                  disappear: isparticle,
                  child: Image.network(
                      'https://i.pinimg.com/564x/61/f1/ab/61f1abb54cbce8c67bed69e0bfe19520.jpg'),
                ),
                spacingheight10,
                InkWell(
                  onTap: () {
                    isparticle = !isparticle;

                    SnappableState state = key.currentState!;
                    if (state.isInProgress) {
                      // do nothing
                      debugPrint("Animation is in progress, please wait!");
                    } else if (state.isGone) {
                      state.reset();
                    } else {
                      state.snap();
                    }
                    setState(() {});
                  },
                  child: Text(isparticle.toString()),
                ),
                Snappable(
                  key: key,
                  snapOnTap: true,
                  onSnapped: () {},
                  child: Image.network(
                    'https://i.pinimg.com/564x/1b/b9/ee/1bb9ee65cbb4bd97d94c8d177c46b440.jpg',
                    height: 300,
                  ),
                ),
                spacingheight100,
                Container(
                  color: Colors.black.withOpacity(.7),
                  child: BubbleLens(
                      width: MediaQuery.of(context).size.width,
                      height: 850,
                      widgets: [
                        // for (var i = 0; i < user.recursoList.length; i++)
                        // Container(width:300, height: 300, color: Colors.red),
                        ...user.recursoList.map((e) => InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UsuariogestionPage())),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(e.image),
                            )))
                      ]),
                ),
                SearchPages(user: user),

                BlurWidget(
                  colorblur: Colors.red,
                  height: 300,
                  child: ClickableListWheelScrollView(
                    scrollController: _scrollController,
                    itemHeight: _itemHeight,
                    itemCount: _itemCount,
                    onItemTapCallback: (index) {
                      print("onItemTapCallback index: $index");
                    },
                    child: ListWheelScrollView.useDelegate(
                      
                      controller: _scrollController,
                      itemExtent: _itemHeight,
                      physics: const FixedExtentScrollPhysics(),
                      overAndUnderCenterOpacity: 0.9,
                      perspective: 0.002,
                      onSelectedItemChanged: (index) {
                        print("onSelectedItemChanged index: $index");
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) => _child(index),
                        childCount: _itemCount,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void snap() {
    key.currentState!.snap();
  }

  Widget _child(int index) {
    return Container(
      color: Colors.white,
      height: _itemHeight,
      child: const ListTile(
        title: Text('hola'),
      ),
    );
  }
}

class SearchPages extends StatelessWidget {
  const SearchPages({
    Key? key,
    required this.user,
  }) : super(key: key);

  final RecursosProvider user;

  @override
  Widget build(BuildContext context) {
    return BlurWidget(
        height: 400,
        colorblur: Colors.black.withOpacity(.3),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      useRootNavigator: true,
                      context: context,
                      delegate: SearchPage<User>(
                          searchStyle: const TextStyle(color: Colors.red),
                          barTheme: ThemeData.from(
                              colorScheme: const ColorScheme.light().copyWith(
                                  background: Colors.white,
                                  onPrimary: Colors.white)),

                          onQueryUpdate: (value) => print(value),
                          items: user.recursoList,
                          searchLabel: 'Buscar ususarios',
                          suggestion: const Center(
                            child: Text('Filtrar datos'),
                          ),
                          failure: const Center(
                            child: Text('No se encontro resultados'),
                          ),
                          filter: (usuario) =>
                              [usuario.nombreCompleto, usuario.cargo],
                          builder: (usuario) => InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UsuariogestionPage())),
                                child: Container(
                                  color: Colors.black.withOpacity(.7),
                                  child: ListTile(
                                    title: Text(
                                        '${usuario.nombreCompleto} ${usuario.apellido}'),
                                    subtitle: Text(usuario.cargo),
                                  ),
                                ),
                              )));
                },
              ),
              ...List.generate(
                user.recursoList.length,
                (index) => ListTile(
                  title: Text(user.recursoList[index].nombreCompleto),
                  leading: InstaImageViewer(
                      disposeLevel: DisposeLevel.low,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Image.network(user.recursoList[index].image),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
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
    final currentImagesize =
        (maxHeight * (1 - percent)).clamp(minImageSize, maxImageSize);
    return Container(
      color: Colors.blueGrey,
      child: Stack(
        children: [
          Positioned(
            top: 60,
            left: ((size.width * .3) + (60 * percent)),
            height: maxImageSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextStyleUi(
                    fontWeight: FontWeight.bold,
                    size: (maxTitleSize * (1 - percent))
                        .clamp(minTitleSize, maxTitleSize),
                    text: 'Sliver AppBar',
                    color: Colors.black),
                TextStyleUi(
                    fontWeight: FontWeight.bold,
                    size: (maxTitleSize * (1 - percent))
                        .clamp(minSubTitleSize, maxSubTitleSize),
                    text: 'SubTile Sliver AppBar',
                    color: Colors.black.withOpacity(.5)),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              left: (150 * (1 - percent)).clamp(33, 150),
              height: currentImagesize,
              child: Transform.rotate(
                  angle: vector.radians(360 * percent),
                  child: Image.network(
                      'https://i.pinimg.com/564x/05/24/6f/05246f8b0989eb16e2b0ca9810e3a208.jpg'))),
          Positioned(
              bottom: 20,
              left: 35,
              height: currentImagesize,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      'https://i.pinimg.com/564x/52/cc/56/52cc56c44094ab87417a3be4c4958555.jpg'))),
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
