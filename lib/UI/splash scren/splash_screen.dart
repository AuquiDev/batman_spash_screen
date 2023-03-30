
import 'package:batman_spash_screen/UI/splash%20scren/intro_view_page.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter/material.dart';

class SplashScreenSignUp extends StatefulWidget {
  const SplashScreenSignUp({super.key});

  @override
  State<SplashScreenSignUp> createState() => _SplashScreenSignUpState();
}

class _SplashScreenSignUpState extends State<SplashScreenSignUp>
    with SingleTickerProviderStateMixin {
  //ANimation: transsicion moviemientos
  late AnimationController _animationController;
  //Animacion: entrada de logo
  late Animation<double> _animationLogoIn;
  //animation logo movimiento despues de entrar
  late Animation<double> _animationLogoMovementUp;
  //para la opcidad 2 de logo
  late Animation<double> _animationLogoMovementUp2;

  @override
  void initState() {
    // implement initState
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));

    _animationLogoIn = Tween(begin: 180.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.25)));
    _animationController.forward();
    //para el opacity
    _animationLogoMovementUp = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.30, 0.75));
    //para el opacity del logo
    _animationLogoMovementUp2 = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.70, 0.75));
    //repetir splash screen
    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Scaffold(
            body: Stack(
              children: [
                BackgroundPageWdiget(
                  image: const NetworkImage(
                      'https://i.pinimg.com/564x/ec/ca/82/ecca820911862c11c3d9cdf31c5fbfb8.jpg'),
                  isvisible: false,
                ),
                Opacity(
                    opacity: _animationLogoMovementUp.value,
                    child: Hero(
                      tag: 'logo',
                      transitionOnUserGestures: true,
                      child: BackgroundPageWdiget(
                        image: const AssetImage('assets/cerro_colores.png'),
                        isvisibleCircle: true, isvisible: false,
                      ),
                    )),
                Positioned(
                  bottom: 270 - 190 * _animationLogoMovementUp2.value,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: _animationLogoMovementUp2.value,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                      color: Colors.white,
                      width: 150,
                      height:120,// width < 500 ? height * .13 : height * .27,
                    ),
                  ),
                ),
                Positioned(
                    top: height * .3 - height*.27 * _animationLogoMovementUp2.value,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Transform.scale(
                          scale: _animationLogoIn.value,
                          child: _ImageLLama(
                            animation: _animationLogoMovementUp.value,
                            animation2 : _animationLogoMovementUp2.value
                          ),
                        ),
                      ],
                    )),
 
                Positioned(
                  bottom: 90,
                  right: 0,
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      TextStyleUi(fontWeight: FontWeight.bold, size: 17, text: 'Andean Lodges', color: Colors.white),
                      TextStyleUi(fontWeight: FontWeight.bold, size: 12, text: 'Logística', color: Colors.white),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Opacity(
                    opacity: _animationLogoMovementUp.value,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: ButtonLogin(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const IntroViewsPage()));
                          setState(() {});
                        },
                        text: 'Bienvenido',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class _ImageLLama extends StatelessWidget {
  _ImageLLama({required this.animation,required this.animation2});
  double animation;
  double animation2;
  
  @override
  Widget build(BuildContext context) {

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(vector.radians(180 * animation)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          animation != 0
              ? Image.asset(
                  'assets/guanaco.png',
                  fit: BoxFit.contain,
                  color: animation2 == 0
                ? Colors.black
                :Colors.white24,
                  width: 90 - 3,
                  height: 90 - 3,
                )
              : const SizedBox(),
         Image.asset(
            'assets/guanaco.png',
            fit: BoxFit.contain,
            color: animation2 == 0
                ? Colors.black
                :Colors.white10,
            width: 90,
            height: 90,
          )
        ],
      ),
    );
  }
}
