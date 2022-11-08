import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:vita_health/view/tela_principal.dart';

class TreinoSemanal extends StatefulWidget {
  const TreinoSemanal({super.key});

  @override
  State<TreinoSemanal> createState() => _TreinoSemanalState();
}

class _TreinoSemanalState extends State<TreinoSemanal> {

  List<bool> clicado1 = [];
  List<bool> clicado2 = [];
  List<bool> clicado3 = [];
  TextEditingController timeInput = TextEditingController();
  TextEditingController timeInput2 = TextEditingController();
  TextEditingController timeInput3 = TextEditingController();
  bool treinar1 = false;
  bool treinar2 = false;
  bool treinar3 = false;
  List <String> semana = ['D','S','T','Q','Q','S','S'];

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
    return Padding(
      padding: const EdgeInsets.only(top:30),
      child: SizedBox(
        width:  MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Treino Semanal', style: TextStyle(fontSize: 17,),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // LINHA 1 -------------------------------------------
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.all(0),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('Caminhada:'),
                            value: treinar1,
                            onChanged: (value){
                              setState(() {
                                treinar1 = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Horário'
                            ),
                            mouseCursor: MouseCursor.defer,
                            enabled: treinar1,
                            controller: timeInput,
                            readOnly: true,
                            onTap: () async{
                              TimeOfDay? pickedTime = await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context, 
                              );
                              if(pickedTime != null){
                                DateTime parsedTime  = DateFormat.Hm().parse(pickedTime.format(context).toString());
                                String formattedTime = DateFormat('kk:mm').format(parsedTime);
                                setState(() {
                                  timeInput.text = formattedTime; 
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: semana.length,
                      itemBuilder: (context, index) =>
                        Padding(
                          padding: const EdgeInsets.only(right:4),
                          child: Checkbox(
                            checkColor: Colors.yellow,
                            value: clicado1[index],
                            onChanged: treinar1 ? ((value) => setState(() {
                              clicado1[index] = value!;
                            })) : null,
                          ),
                        ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...semana.map((e) => Text(e, style: TextStyle(color: treinar1 ? Colors.black : Colors.grey),)),
                    ]
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // LINHA 2 ----------------------------------------
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: CheckboxListTile(
                              contentPadding: EdgeInsets.all(0),
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text('Corrida:'),
                              value: treinar2,
                              onChanged: (value){
                                setState(() {
                                  treinar2 = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Horário',
                              ),
                              enabled: treinar2,
                              controller: timeInput2,
                              readOnly: true,
                              onTap: () async{
                                TimeOfDay? pickedTime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context, 
                                );
                                if(pickedTime != null){
                                  DateTime parsedTime  = DateFormat.jm().parse(pickedTime.format(context).toString());
                                  String formattedTime = DateFormat('hh:mm').format(parsedTime);
                                  setState(() {
                                    timeInput2.text = formattedTime; 
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: semana.length,
                        itemBuilder: (context, index) =>
                          Padding(
                            padding: const EdgeInsets.only(right:4),
                            child: Checkbox(
                              checkColor: Colors.yellow,
                              value: clicado2[index], 
                              onChanged: treinar2 ? (value){
                                setState(() {
                                  clicado2[index] = value!;
                                });
                              } : null,
                            ),
                          ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...semana.map((e) => Text(e, style: TextStyle(color: treinar2 ? Colors.black : Colors.grey),)),
                      ]
                    ),
                  ],
                ),
              ),
                // LINHA 3 ----------------------------------------------------
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: CheckboxListTile(
                              contentPadding: EdgeInsets.all(0),
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text('Pular corda:'),
                              value: treinar3,
                              onChanged: (value){
                                setState(() {
                                  treinar3 = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Horário',
                              ),
                              enabled: treinar3,
                              controller: timeInput3,
                              readOnly: true,
                              onTap: () async{
                                TimeOfDay? pickedTime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context, 
                                );
                                if(pickedTime != null){
                                  DateTime parsedTime  = DateFormat.jm().parse(pickedTime.format(context).toString());
                                  String formattedTime = DateFormat('hh:mm').format(parsedTime);
                                  setState(() {
                                    timeInput3.text = formattedTime; 
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: semana.length,
                        itemBuilder: (context, index) =>
                          Padding(
                            padding: const EdgeInsets.only(right:4),
                            child: Checkbox(
                              checkColor: Colors.yellow,
                              value: clicado3[index], 
                              onChanged: treinar3 ? (value){
                                setState(() {
                                  clicado3[index] = value!;
                                });
                              } : null,
                            ),
                          ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...semana.map((e) => Text(e, style: TextStyle(color: treinar3 ? Colors.black : Colors.grey),)),
                      ]
                    ),
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}