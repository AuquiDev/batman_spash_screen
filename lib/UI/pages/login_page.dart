import 'package:batman_spash_screen/UI/general/general.dart';
import 'package:batman_spash_screen/UI/pages/homepage.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';
import 'package:batman_spash_screen/models/model.dart';
import 'package:batman_spash_screen/service/user_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isLoading = true;
  //
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<RecursosProvider>(context, listen: true);
    final List<User> users = userProvider.recursoList;
    final size = MediaQuery.of(context).size;

    String userCorrecto;
    String passwordcorecto;

    void login() {
      FormState? formState = formkey.currentState!;
      if (formState.validate()) {
        formState.save();
        for (int i = 0; i < users.length; i++) {
          userCorrecto = users[i].dni.toString();
          passwordcorecto = users[i].password;

          if (userCorrecto.toLowerCase() == username.toLowerCase() &&
              passwordcorecto == password) {
            switch (users[i].role) {
              case 'admin':
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              userlogin: users[i],
                              listUsers: userProvider,
                              index: i,
                            )),
                    (route) => false);
                break;
              default:
            }
          }
        }
      } else {
        !isLoading;
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor:
                const Color.fromARGB(255, 175, 59, 33).withOpacity(.8),
            content: Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                spacingwidth10,
                const Text(
                  "Ha ocurrido un error, intentalo nuevamente.",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            )));
      }
    }

    return Scaffold(
      // backgroundColor: Colors.white,
      body: isLoading == true
          ? Stack(
              children: [
                BackgroundPageWdiget(
                    image: const NetworkImage(
                        'https://i.pinimg.com/564x/65/18/4a/65184af0f74b717fe3ed688b60e80faa.jpg'),
                    isvisible: false),
                Hero(
                  tag: 'logo',
                  transitionOnUserGestures: true,
                  child: BackgroundPageWdiget(
                    isvisible: false,
                    image: const AssetImage('assets/cerro_colores.png'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: BlurWidget(
                        colorblur:Colors.white.withOpacity(.4),
                        height: size.height * .6,
                        child: Padding( padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: BlurWidget(
                                      height: 6,
                                      colorblur:
                                          kfontPrimaryColor.withOpacity(1),
                                      child: const SizedBox(
                                        width: 50,
                                      ))
                                    ),
                              spacingheight10,
                              TextStyleUi(
                                text: 'Andean Lodges',
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.bold,
                                size: 20,
                                color: const Color.fromARGB(255, 111, 69, 5)
                                    .withOpacity(1),
                              ),
                              spacingheight10,

                              TextStyleUi(
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.bold,
                                  size: 13,
                                  text: 'Tu numero de DNI',
                                  color: kfontPrimaryColor),
                              TextFormField(
                                style: TextStyle(
                                    color: kfontPrimaryColor, fontSize: 12),
                                decoration: decorationinputtext(
                                    'Ingresa tu DNI', 'Ingresa tu DNI'),
                                keyboardType: TextInputType.number,
                                maxLength: 8,
                                inputFormatters: [
                                  //Expresion Regular
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                                onSaved: (values) {
                                  username = values!;
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
                              ),



                              TextStyleUi(
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.bold,
                                  size: 13,
                                  text: 'Tu contraseña',
                                  color: kfontPrimaryColor),
                              TextFormField(
                                obscureText: isVisible,
                                style: TextStyle(
                                    color: kfontPrimaryColor, fontSize: 14),
                                decoration: InputDecoration(
                                    hintText: 'Ingresa tu contraseña',
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      color:
                                          kfontPrimaryColor.withOpacity(.5),
                                    ),
                                    enabledBorder: outlineInputBorder(),
                                    focusedBorder: outlineInputBorder(),
                                    errorBorder: outlineInputBorder(),
                                    border: outlineInputBorder(),
                                    disabledBorder: outlineInputBorder(),
                                    focusedErrorBorder:
                                        outlineInputBorder(),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          isVisible = !isVisible;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          isVisible != true
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          size: 18,
                                          color: kfontPrimaryColor
                                              .withOpacity(.5),
                                        ))),
                                keyboardType: TextInputType.visiblePassword,
                                onSaved: (value) {
                                  password = value!;
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
                              ),
                              
                              ButtonLogin(
                                  onTap: () {
                                    login();
                                    setState(() {});
                                  },
                                  text: 'Iniciar sesión'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
