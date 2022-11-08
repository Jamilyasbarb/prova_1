import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vita_health/models/user_model.dart';


class RegisterPage extends StatefulWidget {
  
  RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

  List<User>usersList = [];

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formRegisterKey = GlobalKey();
  File? imagem;
  bool senhaVisivel = false;

  Future pickImage(ImageSource source) async {
    final imagem = await ImagePicker().pickImage(source: source);
    try{
      if(imagem == null) return;
      final imagemTemporaria = File(imagem.path);
      setState(() {
        this.imagem = imagemTemporaria;
      });
    }catch(e){
      print('Failed to pick image: $e');
    }
  }

  String nome = '';
  String email = '';
  double celular = 0;
  String usuario = '';
  String senha = '';
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formRegisterKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar Usuário'),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => pickImage(ImageSource.camera),
                    child: imagem == null ? ClipOval(
                      child: Container(
                        height: 150,
                        width: 150,
                        color: Color.fromARGB(255, 224, 222, 222),
                        child: Icon(Icons.camera_alt_outlined),
                      ),
                    ) : SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  // alignment: FractionalOffset.,
                                  image: FileImage(imagem!),
                                ),
                              ),
                              //  child: Image.file(imagem!),
                            ),
                      ),
                    ),
                    ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                    validator: (value) {
                      RegExp regExp = RegExp(r"^[a-zA-Zá-éÁ-É]+ [a-zA-Zá-éÁ-É]+$");
                      if(!regExp.hasMatch(value!)){
                        return 'Inserir nome e sobrenome';
                      }else if(value == ''){
                       return "Campo obrigatório";
                      }else{
                        nome = value.toString();
                      }
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (emailDigitado) {
                      RegExp regExp = RegExp(r"^([^0-9]+)([.|_a-zA-Z0-9]+){5}@([a-zA-Z0-9]+){3}((\.[a-zA-Z0-9]{2,3})+\.*[a-z]{1,2})$");
                      if(emailDigitado == '' || emailDigitado == null){
                        return "Campo obrigatório";
                      }
                      else if(!regExp.hasMatch(emailDigitado)){
                        print(!regExp.hasMatch(emailDigitado));
                        return "Email inválido"; 
                      }else{
                        email = emailDigitado.toString();
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration( 
                      labelText: 'Celular',
                      
                    ),
                    validator: (value) {
                      if(value == ''){
                        return 'Campo obrigatório';
                      }else{
                        celular = double.parse(value.toString());
                        print(celular);
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Usuário',
                    ),
                    validator: (value) {
                      RegExp regExp= RegExp(r"^([^0-9])(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])([A-Za-z0-9\._]+){5}$");
                      for(var i = 0; i< usersList.length; i++){
                        if(value == usersList[i].usuario){
                          return 'Já existe alguém com esse nome';
                        }
                      }
                      if(value == '' || value == null){
                        return'Campo obrigatório';
                      }else if(!regExp.hasMatch(value)){
                        return 'Obrigatório conter pelo menos: Um numero, uma letra minúscula e uma maiúscula. Não é permitido acento e nem caracteres especiais[?@#!]';
                      }else{
                        usuario = value.toString();
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !senhaVisivel,
                          decoration: InputDecoration(
                          labelText: 'Senha',
                          suffixIcon: IconButton(
                            icon:Icon(senhaVisivel ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => setState(() {senhaVisivel = !senhaVisivel;}),
                          ),
                          ),
                          
                          validator: (value) {
                            RegExp regExp =RegExp(r"^([^0-9])(?=.*[0-9])(?=(.*?[0-9]){2})(?=.*[A-Z])(?=.*[a-z])([A-Za-z0-9\._]+){7,}$");
                            if(value == '' || value == null){
                              return 'Campo obrigatório';
                            }else if(!regExp.hasMatch(value)){
                              return 'Verifique as regras abaixo';
                            }else{
                              senha = value.toString();
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Repita a Senha',
                          ),
                          validator: (value) {
                            if(value != senha){
                              return 'senha incorreta';
                            }else if(value == ''){
                             return 'Campo obrigatório';
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red
                            ),
                            onPressed: (){
                              if(_formRegisterKey.currentState!.validate()){
                                // usersList.add(_formRegisterKey);
                                // print(_formRegisterKey.currentWidget);
                                  User addUser = User(nome: nome, email: email, celular: celular, usuario: usuario, senha: senha, jaAcessei: false, imagem: imagem!);
                                  usersList.add(addUser);
                                  print(usersList);
                                  _formRegisterKey.currentState?.reset();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Cadastro Efetuado com sucesso!'),backgroundColor: Colors.green),
                                  );
                                  Navigator.of(context).pushNamed('/login');
                              }else{
                                 ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Algo deu errado. Verifique os campos preenchidos acima.'),backgroundColor: Colors.red),
                                );
                              }
                            },
                            child: Text('Cadastrar'),
                          ),
                        ),

                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 64, 64, 65),
                            ),
                            onPressed: () => showDialog(
                              context: context, 
                              builder: (BuildContext context) =>   AlertDialog(
                                title: Text('Deseja cancelar a operação?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: (){
                                      Navigator.of(context).pushReplacementNamed('/login');
                                    }, 
                                    child: Text('Sim'),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context, 'Cancel');
                                    }, 
                                    child: Text('Não'),
                                  ),
                                ],
                              ),
                            ), 
                            child: Text('Cancelar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                        
                ],
              ),
            ),
          ),
        ),
      ), 
    );
  }
}

