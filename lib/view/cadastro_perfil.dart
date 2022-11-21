import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vita_health/components/treino_semanal_component.dart';
import 'package:vita_health/controllers/imc_controller.dart';

class CadastroPerfil extends StatefulWidget {
  const CadastroPerfil({super.key});

  @override
  State<CadastroPerfil> createState() => _CadastroPerfilState();
}

class _CadastroPerfilState extends State<CadastroPerfil> {

  GlobalKey<FormState> _keyForm = GlobalKey();
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  TextEditingController dataNasc = TextEditingController();
  double p = 0;
  int aCm = 0;
  double aM = 0;
  double imcResultado = 0;
  double imc = 0;
  List<Widget> myListCheckbox = [];
  List <String> semana = ['D','S','T','Q','Q','S','S'];

  List<bool> clicado1 = [];
  List<bool> clicado2 = [];
  List<bool> clicado3 = [];
  int idade = 0;
  

  String get calcImc{
    p = double.tryParse(peso.text) ?? 0.0;
    aCm = int.tryParse(altura.text) ?? 0;
    aM = aCm * 0.01;
      // aM = NumberFormat.currency(decimalDigits: 3).format(aCm);
      print(aM);
      print('---------passei');
      print(aCm.toStringAsFixed(2));

    imc = p / (aM * aM);
    print(imc);

    if(imc < 18.5){
      return 'MAGREZA';
    }else if(imc < 24.9){
      return 'NORMAL';
    }else if(imc < 29.9){
      return 'SOBREPESO';
    }else if(imc < 39.0){
      return 'OBESIDADE';
    }else if(imc >= 40){
      return 'OBESIDADE GRAVE';
    }
      return '';
  }


  @override
  void initState() {
    // TODO: implement initState
    clicado1 = List<bool>.filled(semana.length, false);
    clicado2 = List<bool>.filled(semana.length, false);
    clicado3 = List<bool>.filled(semana.length, false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de perfil'),
        backgroundColor: Colors.red,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Seja Bem-Vindo(a)', style: TextStyle(fontSize: 17),),
                const SizedBox(height: 25,),
                const Text('Como esse é seu primeiro acesso, precisamos de mais algumas informações para continuar'),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _keyForm,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                             labelText: 'Data Nascimento',
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: dataNasc,
                          readOnly: true,
                          onTap: () async{
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2101),
                            );
                            if(pickedDate != null){
                              DateTime hoje = DateTime.now();
                              idade = hoje.year - pickedDate.year; 
                              if(hoje.month < pickedDate.month){
                                idade--;
                              }else if(hoje.month == pickedDate.month){
                                if(hoje.day < pickedDate.day){
                                  idade--;
                                }
                              }
                               String formattedDate = DateFormat('d/MM/y').format(pickedDate);
                               setState(() {
                                  idade;
                                  dataNasc.text = formattedDate;
                               });
                            }
                          },
                          validator: (value) {
                            if(value != null && value != ''){
                              if(idade < 18){
                                return 'Idade não permitida';
                              }
                            }else{
                              return 'Campo Obrigatório';
                            }
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Peso(KG)'
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                controller: peso,
                                onChanged: (value) {
                                  setState(() {
                                    calcImc;
                                    imcResultado = imc;
                                  });
                                },
                                validator: ((value) {
                                  if(value ==null || value == ''){
                                    return 'Campo Obrigatório';
                                  }
                                }),
                              ),
                            ),
                           const SizedBox(width: 20,),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Altura(CM)'
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                controller: altura,
                                validator: (value) {
                                  if(value ==null|| value == ''){
                                    return 'Campo Obrigatório';
                                  }
                                  // calcImc;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    calcImc;
                                    imcResultado = imc;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Seu imc é de ${imcResultado.toStringAsFixed(2)} o que indica $calcImc',),
                const TreinoSemanal(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                      ),
                      child: Text('Salvar'),
                      onPressed: (){
                        if(_keyForm.currentState!.validate()){
                          Navigator.of(context).pushReplacementNamed('/login');
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Algo deu errado. Verifique os campos preenchidos acima.'),backgroundColor: Colors.red),
                          );
                        }
                      },
                    ),
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

