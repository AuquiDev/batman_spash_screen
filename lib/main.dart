import 'package:batman_spash_screen/UI/splash%20scren/splash_screen.dart';
import 'package:batman_spash_screen/service/service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false,create: (_)=> RecursosProvider()),
        ChangeNotifierProvider(create: (_)=> ThemePage(1))//thema de la aplicacion: dark o light
      ],
      child: const MyApp() ,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeApp = Provider.of<ThemePage>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const SplashScreenSignUp(),
      theme: themeApp
      );
  }
}