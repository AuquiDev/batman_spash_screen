


import 'package:flutter/material.dart';

enum InputTypeEnum{
  text,
  dni,
  telefono,
} 
Map<InputTypeEnum, TextInputType> inputTypeMAp = {
  InputTypeEnum.text : TextInputType.text,
  InputTypeEnum.dni : TextInputType.number,
  InputTypeEnum.telefono: TextInputType.phone
};