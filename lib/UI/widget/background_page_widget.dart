import 'dart:math';

import 'package:flutter/material.dart';


// ignore: must_be_immutable
class BackgroundPageWdiget extends StatelessWidget {
   BackgroundPageWdiget({super.key, 
    required this.image,
    required this.isvisible
  });

  ImageProvider image;
  bool isvisible =true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration:  BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image:image)),
          ),
        Container(
          decoration: _decoration(),
        ),
       
       isvisible==true ?  Positioned(
            top: -100,
            left: -50,
            child: Transform.rotate(
              angle: -pi / 5,
              child: Container(
                width: 360,
                height: 360,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(80),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(236, 98, 188, 1),
                    Color.fromRGBO(236, 98, 188, .5)
                  ]),
                ),
              ),
            )) : const SizedBox()
      ],
    );
  }

  BoxDecoration _decoration() {
    return  BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.2, 0.75],
          colors: [const Color(0xff2e305f).withOpacity(.5), const Color(0xff202333).withOpacity(1)]),
    );
  }
}