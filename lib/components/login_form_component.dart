import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../view/register_page_component.dart';
import '../view/tela_principal.dart';

class LoginForm extends StatefulWidget {

  @override
  State<LoginForm> createState() => _LoginFormState();
  
}

class _LoginFormState extends State<LoginForm> {

  GlobalKey<FormState> _keyForm = GlobalKey();
  bool hasUser = false;
  bool senhaVisivel = false;
  bool bloqueado = false;
  int cont = 0;
  String senha = '';
  String usuario = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:30),
            child: SizedBox(
              width: 300,
              child: TextFormField(
                enabled: !bloqueado,
                 
                // controller: fieldUsuario,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Color.fromRGBO(46, 217, 195, 1), width: 2)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)
                  )
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
                // controller: fieldSenha,
                validator: (value) {
                  if(value == '' || value == null){
                    return 'Campo obrigatório';
                  }else{
                    senha = value.toString();
                  }
                },
              ),
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
                  onPressed:  !bloqueado ? _validar : null,
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
    );
  }
  void _validar(){
    print('passei por aqui9999');
    for(var i =0; i < usersList.length; i++){
      print(usersList[i].usuario);
      print(usersList[i].senha);
      print(usuario);
      print(senha);
      if(_keyForm.currentState!.validate() && usuario == usersList[i].usuario && senha == usersList[i].senha){
        print('passei por aqui');
        hasUser=true;
        // fieldSenha.clear();
        // fieldUsuario.clear();
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
    _loginBloqueado();
  }

  void _loginBloqueado(){
    print('passei 8888');
    if(!hasUser){
      cont++;
      // fieldSenha.clear();
      if(cont == 3){
        // fieldSenha.clear();
        // fieldUsuario.clear();
        setState(() {
          bloqueado = true;
          usuario = '';
          senha = '';
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
  }
}
