// ignore_for_file: non_constant_identifier_names

import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TExformFieldUi extends StatelessWidget {
  TExformFieldUi(
      {Key? key,
      required this.text,
      required this.hinttext,
      // this.keyboardType,
      required this.controller,
      this.inputTypeEnum
      
      })
      : super(key: key);
  String text;
  String hinttext;
  // TextInputType? keyboardType;
  TextEditingController controller;
  InputTypeEnum? inputTypeEnum;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyleUi(
            textAlign: TextAlign.start,
            fontWeight: FontWeight.normal,
            size: 15,
            text: text,
            color: kfontPrimaryColor),
        spacingheight10,
        TextFormField(
          style: TextStyle(color: kfontPrimaryColor, fontSize: 15),
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(
              fontSize: 13,
              color: kfontPrimaryColor.withOpacity(.5),
            ),
            enabledBorder: _OutlineInputBorder(),
            focusedBorder: _OutlineInputBorder(),
            errorBorder: _OutlineInputBorder(),
          ),
          keyboardType: inputTypeMAp[inputTypeEnum],
        ),
        spacingheight20
      ],
    );
  }

  OutlineInputBorder _OutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          BorderSide(color: kfontSecondaryColor.withOpacity(.5), width: .5),
    );
  }
}

// // ignore: must_be_immutable
// class TExformFieldPasswordUi extends StatefulWidget {
//   TExformFieldPasswordUi(
//       {Key? key,
//       required this.text,
//       required this.hinttext,
//       required this.keyboardType,
//       required this.controller
//       })
//       : super(key: key);
//   String text;
//   String hinttext;
//   TextInputType? keyboardType;
 
//   TextEditingController controller;


//   @override
//   State<TExformFieldPasswordUi> createState() => _TExformFieldPasswordUiState();
// }

// class _TExformFieldPasswordUiState extends State<TExformFieldPasswordUi> {
//   bool isVisible = true;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextStyleUi(
//             textAlign: TextAlign.start,
//             fontWeight: FontWeight.normal,
//             size: 15,
//             text: widget.text,
//             color: kfontPrimaryColor),
//         spacingheight10,
//         TextFormField(
//           controller: widget.controller,
//           obscureText: isVisible,
//           style: TextStyle(color: kfontPrimaryColor, fontSize: 15),
//           decoration: InputDecoration(
//               hintText: widget.hinttext,
//               hintStyle: TextStyle(
//                 fontSize: 13,
//                 color: kfontPrimaryColor.withOpacity(.5),
//               ),
//               enabledBorder: _outlineInputBorder(),
//               focusedBorder: _outlineInputBorder(),
//               errorBorder: _outlineInputBorder(),
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   isVisible = !isVisible;
//                   setState(() {});
//                 },
//                 icon: isVisible != true
//                     ? Icon(
//                         Icons.visibility,
//                         size: 18,
//                         color: kfontPrimaryColor.withOpacity(.5),
//                       )
//                     : Icon(
//                         Icons.visibility_off,
//                         size: 18,
//                         color: kfontPrimaryColor.withOpacity(.5),
//                       ),
//               )),
//           keyboardType: widget.keyboardType,
//         ),
//         spacingheight20
//       ],
//     );
//   }

//   OutlineInputBorder _outlineInputBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide:
//           BorderSide(color: kfontSecondaryColor.withOpacity(.5), width: .5),
//     );
//   }
// }
