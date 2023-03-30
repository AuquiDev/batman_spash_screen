import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgroundPageWdiget extends StatelessWidget {
  BackgroundPageWdiget(
      {super.key, required this.image, required this.isvisible, this.widget,this.isvisibleCircle});

  ImageProvider image;
  bool isvisible = true;
  bool? isvisibleCircle = true;
  Widget? widget;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: image)),
        ),
        Container(
          decoration: _decoration(),
        ),
        isvisible == true
            ? Positioned(
                top: -100,
                left: -50,
                child: Transform.rotate(
                  angle: -pi / 5,
                  child: Container(
                    width: size.width*.9,
                    height:size.width*.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(236, 98, 188, .6),
                        Color.fromRGBO(236, 98, 188, .5)
                      ]),
                    ),
                  ),
                ))
            : const SizedBox(),
         isvisibleCircle == true
            ? Positioned(
                top:MediaQuery.of(context).size.height*.01,
                left:0,
                right: 0,
                child: Container(
                  height:140,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/sol.png')),
                  ),
                ))
            : const SizedBox(),
        Container(child: widget,)
      ],
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [
            0.2,
            0.75
          ],
          colors: [
            const Color(0xff2e305f).withOpacity(.5),
            const Color(0xff202333).withOpacity(1)
          ]),
    );
  }
}
