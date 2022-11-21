
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TreinoSemanal extends StatefulWidget {
  const TreinoSemanal({super.key});

  @override
  State<TreinoSemanal> createState() => _TreinoSemanalState();
}

class _TreinoSemanalState extends State<TreinoSemanal> {

  List<bool> clicado1 = [];
  List<bool> clicado2 = [];
  List<bool> clicado3 = [];
  TextEditingController horarioInput = TextEditingController();
  TextEditingController horarioInput2 = TextEditingController();
  TextEditingController horarioInput3 = TextEditingController();
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
                              title: Text('Caminhada'),
                              value: treinar1,
                              onChanged: (value){
                                setState(() {
                                  if(!value!){
                                    clicado1 = List<bool>.filled(semana.length, false);
                                  }
                                  treinar1 = value;
                                });
                              },
                            ),
                          ),
                        _horario(horarioInput, treinar1)
                      ],
                    ),
                  ),
                   _selecionaDiaSemana(treinar1, clicado1),
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
                              title: Text('Corrida'),
                              value: treinar2,
                              onChanged: (value){
                                setState(() {
                                  if(!value!){
                                    clicado2 = List<bool>.filled(semana.length, false);
                                  }
                                  treinar2 = value;
                                });
                              },
                            ),
                          ),
                          _horario(horarioInput2, treinar2)
                        ],
                      ),
                    ),
                     _selecionaDiaSemana(treinar2, clicado2),
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
                              title: Text('Pular Corda'),
                              value: treinar3,
                              onChanged: (value){
                                if(!value!){
                                  clicado3 = List<bool>.filled(semana.length, false);
                                }
                                setState(() {
                                  treinar3 = value;
                                });
                              },
                            ),
                          ),
                          _horario(horarioInput3, treinar3),
                        ],
                      ),
                    ),
                    _selecionaDiaSemana(treinar3, clicado3),
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

  Widget _horario(TextEditingController hora, bool treinoSelecionado){
    return Expanded(
      flex: 2,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Horário',
        ),
        enabled: treinoSelecionado,
        controller: hora,
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
              hora.text = formattedTime; 
            });
          }
        }
      ),
    );
  }

  Widget _selecionaDiaSemana(bool treinar, List<bool>clicado){
    return SizedBox(
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
              value: clicado[index], 
              onChanged: treinar ? (value){
                setState(() {
                  clicado[index] = value!;
                });
              } : null ,
            ),
          ),
      ),
    );
  }
}