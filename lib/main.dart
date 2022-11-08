import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:vita_health/view/cadastro_perfil.dart';

import 'package:vita_health/view/login_page_component.dart';
import 'package:vita_health/view/register_page_component.dart';

import 'view/tela_principal.dart';

main(){
  runApp(VitaHealthApp());
}
class VitaHealthApp extends StatelessWidget {
   const VitaHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      theme: ThemeData(primaryColor: Colors.red),
      initialRoute: '/login',
     routes: {
      '/login':(context) => LoginPage(),
      '/register':(context) =>  RegisterPage(),
      '/perfil':(context) => CadastroPerfil(),
      // '/treino':(context) => CadastroPerfil(),
     },
    );
  }
}

class HomePage extends StatelessWidget {
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
    );
  }
}

