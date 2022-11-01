import 'package:flutter/material.dart';

import 'package:vita_health/components/login_page_component.dart';
import 'package:vita_health/components/register_page_component.dart';

main(){
  runApp(VitaHealthApp());
}
class VitaHealthApp extends StatelessWidget {
   const VitaHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      initialRoute: '/login',
     routes: {
      '/login':(context) => LoginPage(),
      '/register':(context) =>  RegisterPage(),
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

