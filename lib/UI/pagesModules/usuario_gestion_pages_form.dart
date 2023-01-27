import 'dart:io';

import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/service/service.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class UsuarioModule extends StatelessWidget {
  const UsuarioModule({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark); //color de la barra de superior del phone
    //.copyWith( statusBarColor: Colors.redAccent, statusBarBrightness: Brightness.dark ));

    final userProvider = Provider.of<RecursosProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => UserFormProvider(userProvider.selectedUser),
      child: _ProductScreenBody(userProvider: userProvider),
    );
  }
}

class _ProductScreenBody extends StatefulWidget {
  const _ProductScreenBody({
    required this.userProvider,
  });

  final RecursosProvider userProvider;

  @override
  State<_ProductScreenBody> createState() => _ProductScreenBodyState();
}

class _ProductScreenBodyState extends State<_ProductScreenBody> {
  bool expandedimage = false;
  @override
  Widget build(BuildContext context) {
    final uForm = Provider.of<UserFormProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
            BackgroundPageWdiget(
                      image: const NetworkImage(
                          'https://i.pinimg.com/564x/12/b5/62/12b562f81083d278a3138ca017ea5c74.jpg'),
                      isvisible: true,
                    ),
          SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Stack(
                children: [
                
                  Positioned(
                    top: 30,
                    // right: 0,
                    left: 0,
                    height: expandedimage == false ? size.height * .5 : 120,
                    width: expandedimage == false ? size.width : 100,
                    child: InkWell(
                      onTap: () {
                        expandedimage = !expandedimage;
                        setState(() {});
                      },
                      child: BlurWidget(
                        colorblur:
                            const Color.fromARGB(217, 225, 204, 204).withOpacity(.3),
                        height: null,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: getImage(widget.userProvider.selectedUser.image),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white.withOpacity(.9),
                                      radius: 15,
                                      child: Icon(
                                        expandedimage == false
                                            ? Icons.zoom_out
                                            : Icons.zoom_in,
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: expandedimage == false ? size.height * .55 : 150,
                    bottom: 0,
                    child: const UsuariosFOrm(),
                  ),
                  Positioned(
                    top: 150,
                    child: BlurWidget(
                      colorblur: Colors.white.withOpacity(.6),
                      height: 170,
                      child: Container(
                        margin: const EdgeInsets.only(left: 4, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // InkWell(
                            //     onTap: () {
                            //       Navigator.pop(context);
                            //     },
                            //     child: const Icon(
                            //       Icons.arrow_back_ios_new_sharp,
                            //       color: Colors.black,
                            //     )),

                            CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(.2),
                                child: InkWell(
                                    onTap: () async {
                                      final picker = ImagePicker();

                                      // ignore: deprecated_member_use
                                      final PickedFile? pickerFile =
                                          // ignore: deprecated_member_use
                                          await picker.getImage(
                                        source: ImageSource.camera,
                                        // imageQuality: 100//calidad de la imagen
                                      );

                                      if (pickerFile == null) {
                                        // ignore: avoid_print
                                        print('No selecciono nada');
                                        return;
                                      }
                                      // ignore: avoid_print
                                      print('Tenemos Imagen ${pickerFile.path}');
                                      widget.userProvider.updateSelectedUserImage(
                                          pickerFile.path); //reemplazamos la imagen
                                    },
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                      color: Colors.black,
                                    ))),
                            CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(.2),
                                child: InkWell(
                                    onTap: () async {
                                      final picker = ImagePicker();

                                      // ignore: deprecated_member_use
                                      final PickedFile? pickerFile =
                                          // ignore: deprecated_member_use
                                          await picker.getImage(
                                        source: ImageSource.gallery,
                                        // imageQuality: 100//calidad de la imagen
                                      );

                                      if (pickerFile == null) {
                                        // ignore: avoid_print
                                        print('No selecciono nada');
                                        return;
                                      }
                                      // ignore: avoid_print
                                      print('Tenemos Imagen ${pickerFile.path}');
                                      widget.userProvider.updateSelectedUserImage(
                                          pickerFile.path); //reemplazamos la imagen
                                    },
                                    child: const Icon(
                                      Icons.image,
                                      size: 30,
                                      color: Colors.black,
                                    ))),

                            //Boton guardar Cambios
                            CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(.2),
                              child: InkWell(
                                onTap: widget.userProvider.isaving
                                    ? null
                                    : () async {
                                        //GUARDAR CMABIOS
                                        if (!uForm.isValidation()) return;
                                        final String? imageUrl =
                                            await widget.userProvider.uploadImage();
                                        if (imageUrl != null) {
                                          uForm.userform.image = imageUrl;
                                        }
                                        await widget.userProvider
                                            .saveOrCreateProduct(uForm.userform);

                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      },
                                child: widget.userProvider.isaving
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.save,
                                        color: Colors.black,
                                      ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getImage(String? picture) {
    if (picture == null) {
      return Image.asset(
        'assets/logo.png',
      );
    }

    if (picture.startsWith('http')) {
      return FadeInImage(
        image: NetworkImage(widget.userProvider.selectedUser.image),
        placeholder: const AssetImage('assets/logo.png'),
        // fit: BoxFit.cover,
      );
    }

    return Image.file(
      File(picture),
      // fit: BoxFit.cover,
    );
  }
}

class UsuariosFOrm extends StatefulWidget {
  const UsuariosFOrm({super.key});
  @override
  State<UsuariosFOrm> createState() => _UsuariosFOrmState();
}

class _UsuariosFOrmState extends State<UsuariosFOrm> {
  bool isChecked = false;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final uForm = Provider.of<UserFormProvider>(context);
    final users = uForm.userform;
    List<String> genero = ['masculino', 'femenino'];
    List<String> roles = [
      'admin',
      'oficina',
      'logistica',
      'guia',
      'cocinero',
      'driver',
      'cliente',
      'proveedor'
    ];
    List<String> cargoPuesto = [
      'Gerente',
      'Administrador',
      'Contador',
      'Reservas',
      'Asistente operaciones',
      'Almacenero',
      'Cocinero',
      'Asistente de Cocina',
      'Chofer',
      'otros'
    ];

    return BlurWidget(
      colorblur: Colors.white.withOpacity(.8),
      height: null,
      child: Container(
        padding: const EdgeInsets.only(top: 30, left: 60, right: 20, bottom: 0),
        child: SingleChildScrollView(
          child: Form(
              key: uForm.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextStyleUi(
                      fontWeight: FontWeight.bold,
                      size: 18,
                      text: 'Datos de usuario',
                      color: Colors.black),
                  spacingheight50,
                  TextFormField(
                    initialValue: users.nombreCompleto,
                    onChanged: (value) => users.nombreCompleto = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obligatorio';
                      }
                      return null;
                    },
                    decoration:
                        decorationinputtext('Nombre del usuario', 'Nombre'),
                    keyboardType: TextInputType.text,
                  ),
                  spacingheight10,
                  TextFormField(
                    initialValue: users.apellido,
                    onChanged: (value) {
                      users.apellido = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obligatorio';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: decorationinputtext(
                        'Apellidos de usuario', 'Apellidos'),
                  ),
                  spacingheight10,
                  DropdownButtonFormField(
                      hint: Text(users.genero),
                      decoration:
                          decorationinputtext('Ingresa genero', 'genero'),
                      items: genero
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        users.genero = value!;
                        isChecked = true;
                        // ignore: avoid_print
                        print(isChecked);

                        setState(() {});
                      }),
                  spacingheight10,
                  DropdownButtonFormField(
                      hint: Text(users.role),
                      decoration:
                          decorationinputtext('Ingresa rol', 'Rol de usuario'),
                      items: roles
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        users.role = value!;
                        isChecked = true;
                        setState(() {});
                      }),
                  spacingheight10,
                  TextFormField(
                    initialValue: users.id == null
                        ? '${users.dni}'.substring(
                            1,
                          )
                        : '${1}${users.dni}'.substring(
                            1,
                          ),
                    onChanged: (value) {
                      users.dni = int.parse(value);
                    },
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Campo obligatorio';
                      }
                      if (value!.length < 8) {
                        return 'Ingrese 8 digitos';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    inputFormatters: [
                      //Expresion Regular
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    decoration: decorationinputtext('Ingresa DNI', 'DNI'),
                  ),
                  spacingheight10,
                  TextFormField(
                    initialValue: users.password,
                    onChanged: (value) {
                      users.password = value;
                    },
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Campo obligatorio';
                      }
                      if (value!.length < 6) {
                        return 'Ingrese mas de 6 caracteres';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: _decorationinputtext2(
                        'ingrese contraseña', 'Contraseña'),
                    obscureText: isVisible,
                  ),
                  spacingheight10,
                  DropdownButtonFormField(
                      hint: Text(users.cargo),
                      decoration: decorationinputtext(
                          'Ingresa puesto de usuario', 'Puesto de trabajo'),
                      items: cargoPuesto
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        users.cargo = value!;
                        isChecked = true;
                        setState(() {});
                      }),
                  spacingheight10,
                  TextFormField(
                      initialValue: users.direccion,
                      onChanged: (value) {
                        users.direccion = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'campo obligatorio';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: decorationinputtext(
                          'Ingrese la dirección', 'Dirección')),
                  spacingheight10,
                  TextFormField(
                      initialValue: users.id == null
                          ? users.telefono.toString().substring(
                                1,
                              )
                          : users.telefono.toString(),
                      onChanged: (value) {
                        users.telefono = int.parse(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obligatorio';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: decorationinputtext(
                          'Ingrese nº telefonico', 'Nº Telefono')),
                  spacingheight10,
                  TextFormField(
                      initialValue: users.id == null
                          ? users.calification.toString().substring(
                                1,
                              )
                          : users.calification.toString(),
                      onChanged: (value) {
                        users.calification = int.parse(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'campo obligatorio';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: decorationinputtext(
                          'Ingrese calificacion', 'Horas extras')),
                  spacingheight10,
                  TextFormField(
                      initialValue: users.correo,
                      onChanged: (value) {
                        users.correo = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'este campo es obligatorio';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Ingrese un correo valido");
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: decorationinputtext(
                          'Ingrese correo', 'Correo electronico')),
                  spacingheight10,
                  SwitchListTile.adaptive(
                    value: users.estatus,
                    title: users.estatus == true
                        ? const Text(
                            'Disponible',
                            style: TextStyle(color: Colors.black),
                          )
                        : const Text(
                            'No Disponible',
                            style: TextStyle(color: Colors.red),
                          ),
                    activeColor: Colors.black,
                    onChanged: uForm.updateAvailability,
                  ),
                  spacingheight30
                ],
              )),
        ),
      ),
    );
  }

  InputDecoration _decorationinputtext2(String hintText, String labeltext) {
    return InputDecoration(
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        border: outlineInputBorder(),
        disabledBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
        hintText: hintText,
        labelText: labeltext,
        suffixIcon: IconButton(
          onPressed: () {
            isVisible = !isVisible;
            setState(() {});
          },
          icon: Icon(
               isVisible != true ?   Icons.visibility :  Icons.visibility_off,
               size: 16,
                  color: kfontPrimaryColor.withOpacity(.5),
                )

        ));
  }
 
}
