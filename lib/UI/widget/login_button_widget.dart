import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonLogin extends StatelessWidget {
  ButtonLogin(
      {Key? key, required this.onTap, required this.text, this.left = true})
      : super(key: key);

  VoidCallback onTap;
  String text;
  bool left;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
          height: 50,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1.5, 1.5), blurRadius: 10, color: Colors.white12)
            ],
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.3,
                  0.7
                ],
                colors: [
                  Color.fromARGB(255, 66, 68, 142),
                  Color(0xff202333),
                  
                ]),
          ),
          child: Center(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                          color: Colors.white,
                          offset: Offset(0, 2),
                          blurRadius: 10),
                    ])),
          ),
        ));
  }
}
