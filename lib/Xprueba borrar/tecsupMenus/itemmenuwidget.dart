
import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Munus extends StatelessWidget {
  Munus(
      {Key? key,
      required this.size,
      required this.url,
      required this.title,
      required this.subTitle})
      : super(key: key);

  final Size size;
  String url;
  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            offset: Offset.zero,
            blurRadius:5,
            color: Color.fromARGB(31, 81, 78, 78)
          )
        ]
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              url,
              width: 100,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          spacingwidth10,
          SizedBox(
            width: size.width * .60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 16, 164, 21),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextStyleUi(
                      fontWeight: FontWeight.bold,
                      size: 16,
                      text: title,
                      color: Colors.white),
                ),
                TextStyleUi(
                  textOverflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  size: 14,
                  text: subTitle,
                  color: Colors.black26,
                  maxLines: 3,
                ),
                spacingheight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 245, 201, 5),
                        ),
                        Text('5.0'),
                      ],
                    ),
                    Text('S/. 50.00'.toUpperCase())
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}