import 'package:batman_spash_screen/pages/batman_button.dart';
import 'package:batman_spash_screen/prebapage.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter/material.dart';

class MainBatmanSignUp extends StatefulWidget {
  const MainBatmanSignUp({super.key});

  @override
  State<MainBatmanSignUp> createState() => _MainBatmanSignUpState();
}

class _MainBatmanSignUpState extends State<MainBatmanSignUp>
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
        parent: _animationController, curve: const Interval(0.60, 0.75));
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
            backgroundColor: const Color.fromARGB(255, 34, 60, 60),
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
                  bottom: 280 - 200 * _animationLogoMovementUp.value,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: _animationLogoMovementUp2.value,
                    child: Image.asset(
                      'assets/logo001.png',
                      fit: BoxFit.contain,
                      color: Colors.white,
                      width: width * .13,
                      height: height * .13,
                    ),
                  ),
                ),
                Positioned(
                    top: height * .3,
                    left: 0,
                    right: 0,
                    child: Transform.scale(
                      scale: _animationLogoIn.value,
                      child: _ImageLLama(
                        animation: _animationLogoMovementUp2.value,
                      ),
                    )),
                Positioned(
                    bottom: 95,
                    right: 0,
                    left:width   - width*.63* _animationLogoMovementUp2.value,
                    child: Transform(
                      alignment: Alignment.center,
                      transform:  Matrix4.identity()
                       ..rotateY(vector.radians(180)),
                      child: Opacity(
                        opacity: _animationLogoMovementUp2.value,
                        child: SizedBox(
                          height: height*.04,
                          // color: Colors.red.withOpacity(.2),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/guanaco.png',
                                fit: BoxFit.contain,
                                color: Colors.tealAccent.withOpacity(.8),
                              ),
                              Image.asset(
                                'assets/guanaco.png',
                                fit: BoxFit.contain,
                                color: Colors.white,
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
                              fontSize:19,
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
                    child: ButtonLogin(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PruebaPage()));
                        setState(() {});
                      },
                      text: 'Login',
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
          Image.asset(
            'assets/guanaco.png',
            fit: BoxFit.contain,
            color: Colors.white,
            width: width * .1 + 3,
            height: height * .1 + 3,
          ),
          Image.asset(
            'assets/guanaco.png',
            fit: BoxFit.contain,
            color: Colors.black,
            width: width * .1,
            height: height * .1,
          ),
          // animation == 1 ? Text('Welcome',style: TextStyle(fontSize: 30,color: Colors.white),) : Text(''),
        ],
      ),
    );
  }
}
