
import 'package:batman_spash_screen/UI/splash%20scren/splash_screen.dart';


import 'package:batman_spash_screen/service/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false,create: (_)=> RecursosProvider()),
        ChangeNotifierProvider(lazy: false,create: (_)=>ProductoProvider()),
      ],
      child: const MyApp() ,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreenSignUp(),//const PoketbaseGet (),
      theme: ThemeData.light().copyWith(textTheme: GoogleFonts.poppinsTextTheme())
      );
  }
}