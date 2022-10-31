import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

main(){
  runApp(VitaHealthApp());
}
class VitaHealthApp extends StatelessWidget {
  const VitaHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Estou com medo de não conseguir... Deus, me ajuda...') 
      ),
    );
  }
}