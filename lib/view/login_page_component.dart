import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


import 'package:vita_health/view/register_page_component.dart';
import 'package:vita_health/view/tela_principal.dart';
import 'package:vita_health/models/user_model.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();
  
  GlobalKey<FormState> _keyForm = GlobalKey();
  final fieldUsuario = TextEditingController();
  final fieldSenha = TextEditingController();
  bool senhaVisivel = false;
  bool bloqueado = false;
  int cont = 0;
  String senha = '';
  String usuario = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding( 
        padding: const EdgeInsets.only(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: SizedBox(
                  width: 150,
                  child: Image.asset('assets/images/logo_RGB.png'),
                ),
              ),
              const Text('Login', style: TextStyle(fontSize: 20),),
                Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:30),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            enabled: !bloqueado,
                            controller: fieldUsuario,
                            decoration: InputDecoration(
                              labelText: 'Usuário',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(color: Colors.pink),
                              ),
                            ),
                            validator: (value) {
                              if(value == '' || value== null){
                                return 'Campo obrigatório';
                              }else{
                                usuario = value.toString();
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            obscureText: !senhaVisivel,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)
                              ),
                              suffixIcon: IconButton(
                                icon:Icon(senhaVisivel ? Icons.visibility : Icons.visibility_off),
                                onPressed: () => setState(() {senhaVisivel = !senhaVisivel;}),
                              ),
                            ),
                            enabled: !bloqueado,
                            controller: fieldSenha,
                            validator: (value) {
                              if(value == ''|| value== null){
                                return 'Campo obrigatório';
                              }else{
                                senha = value.toString();
                                // value = '';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        child: Text('Acessar',),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 64, 64, 65),
                          elevation: 3,
                          textStyle: TextStyle(
                            fontSize: 15,
                            // color: Colors.black
                          ),
                        ),
                        onPressed:  !bloqueado ? (){
                          bool hasUser = false;
                          for(var i =0; i < usersList.length; i++){
                            print(usersList[i].usuario);
                            print(usersList[i].senha);
                            print(usuario);
                            print(senha);
                            if(_keyForm.currentState!.validate() && usuario == usersList[i].usuario && senha == usersList[i].senha){
                              print('passei por aqui');
                              hasUser=true;
                              fieldSenha.clear();
                              fieldUsuario.clear();
                              if(!usersList[i].jaAcessei){
                                usersList[i].jaAcessei = true;
                                Navigator.of(context).pushReplacementNamed('/perfil');
                              }else{
                                Navigator.pushReplacement(context, 
                                  MaterialPageRoute(builder: (context) => TelaPrincipal(usersList[i])),
                                );
                              }
                              break;
                            }
                          }
                          if(!hasUser){
                            cont++;
                              // fieldSenha.clear();
                            if(cont == 3){
                              setState(() {
                                bloqueado = true;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login bloqueado, aguarde 30s!'), 
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              Timer.periodic(Duration(seconds: 1), (timer) {
                                Text(timer.tick.toString()); 
                                if(timer.tick == 30){
                                  timer.cancel();
                                  setState(() {
                                    bloqueado = false;
                                  });
                                }
                              });
                              cont = 0;
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Usuário e/ou senha inválidos'), 
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          }
                        } : null,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: !bloqueado ? (){
                          Navigator.of(context).pushNamed('/register');
                        } : null,
                        child: Text('Cadastre-se'),
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Color.fromARGB(255, 255, 68, 56),
                          textStyle: TextStyle(
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}