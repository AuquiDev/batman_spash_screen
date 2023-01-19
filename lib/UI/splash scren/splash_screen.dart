import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/pages/login_page.dart';
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
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: kfontPrimaryColor,
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: _animationLogoMovementUp.value,
                    child: Image.asset(
                      'assets/bosque.jpeg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  // top: MediaQuery.of(context).size.height * .7,
                  bottom: 270 - 190 * _animationLogoMovementUp2.value,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: _animationLogoMovementUp2.value,
                    child: Image.asset(
                      'assets/logo001.png',
                      fit: BoxFit.contain,
                      color: Colors.white,
                      width: width * .13,
                      height: width < 500 ? height * .13 : height * .27,
                    ),
                  ),
                ),
                Positioned(
                    top: height * .3,
                    left: 0,
                    right: 0,
                    child: Hero(
                      tag: 'logo',
                      transitionOnUserGestures: true,
                      child: Column(
                        children: [
                          //  _animationLogoMovementUp2.value != 0
                          //     ? Opacity(
                          //       opacity: _animationLogoMovementUp2.value,
                          //       child: const Text(
                          //           'Bienvenido',
                          //           style: TextStyle(
                          //               fontSize: 25, color: Colors.white),
                          //         ),
                          //     )
                          //     : const SizedBox(),
                          Transform.scale(
                            scale: _animationLogoIn.value,
                            child: _ImageLLama(
                              animation: _animationLogoMovementUp.value,
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 95,
                    right: 0,
                    left: width < 500
                        ? width - width * .63 * _animationLogoMovementUp2.value
                        : width - width * .8 * _animationLogoMovementUp2.value,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateY(vector.radians(180)),
                      child: Opacity(
                        opacity: _animationLogoMovementUp2.value,
                        child: SizedBox(
                          height: width < 500 ? height * .04 : height * .09,
                          // color: Colors.red.withOpacity(.2),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/guanaco.png',
                                fit: BoxFit.contain,
                                color: Colors.tealAccent,
                              ),
                              Image.asset(
                                'assets/guanaco.png',
                                fit: BoxFit.contain,
                                color: Colors.white,
                                // width: height*.035,
                                // height: height * .038,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  // top: MediaQuery.of(context).size.height * .74,
                  bottom: 90,
                  right: 0,
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Andean Lodges',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    offset: Offset(0, 2),
                                    blurRadius: 10),
                              ])),
                      Text('Logistica',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    offset: Offset(0, 2),
                                    blurRadius: 10)
                              ])),
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
                                  builder: (context) =>  const LoginPage()));
                          setState(() {});
                        },
                        text: 'Login',
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
  _ImageLLama({required this.animation});
  double animation;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(vector.radians(180)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          animation != 0
              ? Image.asset(
                  'assets/guanaco.png',
                  fit: BoxFit.contain,
                  color: Colors.white,
                  width: width * .1 + 4,
                  height: height * .1 + 5,
                )
              : const SizedBox(),
          Image.asset(
            'assets/guanaco.png',
            fit: BoxFit.contain,
            color: Colors.black,
            width: width * .1,
            height: height * .1,
          ),
        ],
      ),
    );
  }
}
