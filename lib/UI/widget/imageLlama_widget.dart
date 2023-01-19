
// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:vector_math/vector_math_64.dart' as vector;

import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ImageLLama extends StatelessWidget {
  ImageLLama({super.key, required this.width, required this.height,this.radius,this.right,this.top});
  double width;
  double height;
  double? top;
  double? right;
  double? radius;
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(vector.radians(180)),
      child: Stack(
        children: [
          Image.asset(
            'assets/guanaco.png',
            fit: BoxFit.contain,
            color: Colors.black,
            width: width,
            height: height,
          ),
          const Positioned(
              top: 16,
              right: 25,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/ojos.gif'),
              ))
        ],
      ),
    );
  }
}
