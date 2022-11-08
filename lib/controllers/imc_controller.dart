class ImcValidator{

  String pesoInput;
  String alturaInput;
  double peso = 0;
  double altura = 0;
  double imc = 0;

  ImcValidator(this.pesoInput, this.alturaInput);
 
String get calcImc{
    peso = double.parse(pesoInput);
    altura= double.parse(alturaInput);
    imc = peso / (altura * altura);

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

  
}