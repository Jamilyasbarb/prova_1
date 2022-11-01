import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              const Text('Login', style: TextStyle(fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.only(top:30),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Usuário',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text('Acessar'),
                        style: ElevatedButton.styleFrom(
                          elevation: 9,
                          textStyle: TextStyle(
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed('/register');
                        },
                        child: Text('Cadastre-se'),
                        style: ElevatedButton.styleFrom(
                          elevation: 9,
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