// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:batman_spash_screen/models/model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RecursosProvider extends ChangeNotifier {
  final String _baseUrl = 'waiki-andean-lodges.fly.dev';

 //Lista de Usuarios: al hacer la peticion get, todos los susarios se cargan en esta lista
  List<User> recursoList = [];
  late User selectedUser;

  File? newPictureFile; //aqui almacenamos la imagen

  bool isaving = false;

  RecursosProvider() {
    print('Recursos Usuario Inicializado');
    getRecursosProvider();
  }

  //get: Traer todos lo Usuarios
  getRecursosProvider() async {
    var url = Uri.https(_baseUrl, '/api/collections/user/records');
    final response = await http.get(url);
    final decodeData = UsuarioModel.fromJson(response.body);

    recursoList = decodeData.user;
    notifyListeners();
  }

  //guardar cambios
  Future saveOrCreateProduct(User user) async {
    isaving = true;
    notifyListeners();

    if (user.id == null) {
      //es nesesario crear usuario
      await createUSer(user);
    } else {
      await updateUSer(user);
    }

    isaving = false;
    notifyListeners();
  }

  Future<String> updateUSer(User user) async {
    var url = Uri.https(_baseUrl, '/api/collections/user/records/:id${user.id}');
    final response = await http.put(url,
        headers: {
          "Content-Type": "application/json",
        },
        body:
            // user.toJson()
            json.encode({
          "items": {
            "nombreCompleto": user.nombreCompleto,
            "apellido": user.apellido,
            "genero": user.genero,
            "role": user.role,
            "dni": user.dni,
            "password": user.password,
            "cargo": user.cargo,
            "direccion": user.direccion,
            "telefono": user.telefono,
            "correo": user.correo,
            "estatus": user.estatus,
            "calification": user.calification,
            "image": user.image,
          }
        }));
    // ignore: unused_local_variable
    final decodeData = response.body;
    //ACTULIZAR EL LISTADO DE PRODUCTOS
    final index = recursoList.indexWhere((element) => element.id == user.id);
    recursoList[index] = user;
    return '${user.id}';
  }

  Future<String> createUSer(User user) async {
    var url = Uri.https(_baseUrl, '/api/collections/user/records');
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          // {
          // "items": 
          {
            "nombreCompleto": user.nombreCompleto,
            "apellido": user.apellido,
            "genero": user.genero,
            "role": user.role,
            "dni": user.dni,
            "password": user.password,
            "cargo": user.cargo,
            "direccion": user.direccion,
            "telefono": user.telefono,
            "correo": user.correo,
            "estatus": user.estatus,
            "calification": user.calification,
            "image": user.image,
          }
        // }
        ));
    final decodeData = json.decode(response.body);
    // final decodeData = response.body;
    user.id = decodeData["id"];
    recursoList.add(user);
    return '${user.id}';
  }

  //CAMBIAR LA IMAGEN EN LA VISTA PREVIA
  void updateSelectedUserImage(String paths) {
    selectedUser.image = paths;
    newPictureFile =
        File.fromUri(Uri(path: paths)); //buscar archivo, y va crear el archivo

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;
    isaving = true;

    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dw2vwrqem/image/upload?upload_preset=y8etxxjt');
    final imageUploadrequest = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadrequest.files.add(file);

    final streamResponse = await imageUploadrequest.send();

    final response = await http.Response.fromStream(streamResponse);

    if (response.statusCode != 200 && response.statusCode != 201) {
      // ignore: avoid_print
      print('Algo salio mal');
      // ignore: avoid_print
      print(response.body);
      return null;
    }

    newPictureFile = null;

    final decodeData = json.decode(response.body);

    return decodeData['secure_url'];
  }
}





// import 'dart:convert';
// import 'dart:io';

// import 'package:batman_spash_screen/models/model.dart';
// import 'package:batman_spash_screen/utils/api_key.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


// class RecursosProvider extends ChangeNotifier {
//   final String _baseUrl = 'api.sheety.co';

//  //Lista de Usuarios: al hacer la peticion get, todos los susarios se cargan en esta lista
//   List<User> recursoList = [];
//   late User selectedUser;

//   File? newPictureFile; //aqui almacenamos la imagen

//   bool isaving = false;

//   //Metodo CONTRUCTOR.
//   RecursosProvider() {
//     // ignore: avoid_print
//     print('Recursos Usuario Inicializado');
//     getRecursosProvider();
//   }

//   //get: Traer todos lo Usuarios
//   getRecursosProvider() async {
//     var url = Uri.https(_baseUrl, '$pathKey/user');
//     final response = await http.get(url);
//     final decodeData = UsuarioModel.fromJson(response.body);

//     recursoList = decodeData.user;
//     notifyListeners();
//   }

//   //guardar cambios
//   Future saveOrCreateProduct(User user) async {
//     isaving = true;
//     notifyListeners();

//     if (user.id == null) {
//       //es nesesario crear usuario
//       await createUSer(user);
//     } else {
//       await updateUSer(user);
//     }

//     isaving = false;
//     notifyListeners();
//   }

//   Future<String> updateUSer(User user) async {
//     var url = Uri.https(_baseUrl, '$pathKey/user/${user.id}');
//     final response = await http.put(url,
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body:
//             // user.toJson()
//             json.encode({
//           "user": {
//             "nombreCompleto": user.nombreCompleto,
//             "apellido": user.apellido,
//             "genero": user.genero,
//             "role": user.role,
//             "dni": user.dni,
//             "password": user.password,
//             "cargo": user.cargo,
//             "direccion": user.direccion,
//             "telefono": user.telefono,
//             "correo": user.correo,
//             "estatus": user.estatus,
//             "calification": user.calification,
//             "image": user.image,
//           }
//         }));
//     // ignore: unused_local_variable
//     final decodeData = response.body;
//     //ACTULIZAR EL LISTADO DE PRODUCTOS
//     final index = recursoList.indexWhere((element) => element.id == user.id);
//     recursoList[index] = user;
//     return '${user.id}';
//   }

//   Future<String> createUSer(User user) async {
//     var url = Uri.https(_baseUrl, '$pathKey/user');
//     final response = await http.post(url,
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: json.encode({
//           "user": {
//             "nombreCompleto": user.nombreCompleto,
//             "apellido": user.apellido,
//             "genero": user.genero,
//             "role": user.role,
//             "dni": user.dni,
//             "password": user.password,
//             "cargo": user.cargo,
//             "direccion": user.direccion,
//             "telefono": user.telefono,
//             "correo": user.correo,
//             "estatus": user.estatus,
//             "calification": user.calification,
//             "image": user.image,
//           }
//         }));
//     final decodeData = json.decode(response.body);
//     // final decodeData = response.body;
//     user.id = decodeData["user"]["id"];
//     recursoList.add(user);
//     return '${user.id}';
//   }

//   //CAMBIAR LA IMAGEN EN LA VISTA PREVIA
//   void updateSelectedUserImage(String paths) {
//     selectedUser.image = paths;
//     newPictureFile =
//         File.fromUri(Uri(path: paths)); //buscar archivo, y va crear el archivo

//     notifyListeners();
//   }

//   Future<String?> uploadImage() async {
//     if (newPictureFile == null) return null;
//     isaving = true;

//     notifyListeners();

//     final url = Uri.parse(
//         'https://api.cloudinary.com/v1_1/dw2vwrqem/image/upload?upload_preset=y8etxxjt');
//     final imageUploadrequest = http.MultipartRequest('POST', url);

//     final file =
//         await http.MultipartFile.fromPath('file', newPictureFile!.path);

//     imageUploadrequest.files.add(file);

//     final streamResponse = await imageUploadrequest.send();

//     final response = await http.Response.fromStream(streamResponse);

//     if (response.statusCode != 200 && response.statusCode != 201) {
//       // ignore: avoid_print
//       print('Algo salio mal');
//       // ignore: avoid_print
//       print(response.body);
//       return null;
//     }

//     newPictureFile = null;

//     final decodeData = json.decode(response.body);

//     return decodeData['secure_url'];
//   }
// }

