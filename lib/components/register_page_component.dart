import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  
  RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formRegisterKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formRegisterKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar Usuário'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    if(value == ''){
                     return "Campo obrigatório";
                    }
                  },
                ),
                TextFormField(
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
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                  ),
                  validator: (value) {
                    if(value == ''){
                      return'Campo obrigatório';
                    }
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        decoration: InputDecoration(
                        labelText: 'Senha',
                        ),
                        validator: (value) {
                          if(value == ''){
                            return 'Campo obrigatório';
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Repita a Senha',
                        ),
                        validator: (value) {
                          if(value == ''){
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
                          onPressed: (){
                            if(_formRegisterKey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data')),
                              );
                            }else{
                              print('---------algo deu errado-------');
                            }
                          },
                          child: Text('Cadastrar'),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pushReplacementNamed('/login');
                          }, 
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
    );
  }
}

