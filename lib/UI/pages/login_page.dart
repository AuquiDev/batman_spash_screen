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
            backgroundColor: Colors.indigoAccent.withOpacity(.5),
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
      backgroundColor: Colors.white,
      body: isLoading == true
          ? Stack(
              children: [
                BackgroundPageWdiget(
                  isvisible: false,
                  image: const NetworkImage(
                      'https://i.pinimg.com/564x/d0/b7/ba/d0b7ba1634a0f732302e9b015e94cfb7.jpg'),
                ),
                SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            spacingheight20,
                            Hero(
                              tag: 'logo',
                              transitionOnUserGestures: true,
                              child: ImageLLama(
                                height: 180,
                                width: 150,
                              ),
                            ),
                            spacingheight20,
                            TextStyleUi(
                              text: 'Andean Lodges',
                              fontWeight: FontWeight.bold,
                              size: 25,
                              color: Colors.white.withOpacity(.7),
                            ),
                            spacingheight10,
                            TextStyleUi(
                              text:
                                  '"Cada día es una nueva oportunidad para hacer algo extraordinario".',
                              fontWeight: FontWeight.bold,
                              size: 13,
                              color: Colors.white.withOpacity(.7),
                              textAlign: TextAlign.justify,
                            ),
                            spacingheight40,
                            //Formulario
                            // isVisible== false ? Text('Contraseña visible, ingrese sus datos nuevamente') : Text(''),
                            BlurWidget(
                              colorblur: Colors.white.withOpacity(.6),
                              height: null,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextStyleUi(
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.normal,
                                        size: 15,
                                        text: 'Tu numero de DNI',
                                        color: kfontPrimaryColor),
                                    spacingheight10,
                                    TextFormField(
                                      style: TextStyle(
                                          color: kfontPrimaryColor, fontSize: 15),
                                      decoration: InputDecoration(
                                        hintText: 'Ingresa tu DNI',
                                        // counter: const SizedBox(),
                                        hintStyle: TextStyle(
                                          fontSize: 13,
                                          color: kfontPrimaryColor.withOpacity(.5),
                                        ),
                                        enabledBorder: _OutlineInputBorder(),
                                        focusedBorder: _OutlineInputBorder(),
                                        errorBorder: _OutlineInputBorder(),
                                        border: _OutlineInputBorder(),
                                        disabledBorder: _OutlineInputBorder(),
                                        focusedErrorBorder: _OutlineInputBorder(),
                                      ),
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
                                    spacingheight20,
                                    TextStyleUi(
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.normal,
                                        size: 15,
                                        text: 'Tu contraseña',
                                        color: kfontPrimaryColor),
                                    spacingheight10,
                                    TextFormField(
                                      obscureText: isVisible,
                                      style: TextStyle(
                                          color: kfontPrimaryColor, fontSize: 15),
                                      decoration: InputDecoration(
                                          hintText: 'Ingresa tu contraseña',
                                          hintStyle: TextStyle(
                                            fontSize: 13,
                                            color:
                                                kfontPrimaryColor.withOpacity(.5),
                                          ),
                                          enabledBorder: _OutlineInputBorder(),
                                          focusedBorder: _OutlineInputBorder(),
                                          errorBorder: _OutlineInputBorder(),
                                          border: _OutlineInputBorder(),
                                          disabledBorder: _OutlineInputBorder(),
                                          focusedErrorBorder: _OutlineInputBorder(),
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
                                    spacingheight20,
                                  ],
                                ),
                              ),
                            ),
                            //Botton Login
                            ButtonLogin(
                                onTap: () {
                                  login();
                                  setState(() {});
                                },
                                text: 'Iniciar sesion')
                          ],
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

  // ignore: non_constant_identifier_names
  OutlineInputBorder _OutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          BorderSide(color: kfontSecondaryColor.withOpacity(.5), width: .5),
    );
  }
}
