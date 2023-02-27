import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextStyleUi extends StatelessWidget {
  TextStyleUi(
      {Key? key,
      required this.fontWeight,
      required this.size,
      required this.text,
      required this.color,
      this.textAlign,
      this.textOverflow,
      this.maxLines
      })
      : super(key: key);
  double size;
  String text;
  FontWeight fontWeight;
  Color color;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          color: color,
          shadows: const[
            Shadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 2),
          ]),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
