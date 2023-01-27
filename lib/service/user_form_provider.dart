
import 'package:batman_spash_screen/models/model.dart';
import 'package:flutter/material.dart';


class UserFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  User userform;

  UserFormProvider(this.userform);

  updateAvailability(bool value){
    // print(value);
    userform.estatus = value;
    notifyListeners();
  }

  bool isValidation(){
    // print(userform.nombreCompleto);
    // print(userform.role);
    // print(userform.estatus);
    // print(userform.direccion);
    return formKey.currentState!.validate() ;//?? false;
  }
}