class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;

  Pessoa(String nome, double peso, double altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }
  
  void setPeso(double peso) {
    _peso = peso;
  }

  double getPeso() {
    return _peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double getAltura() {
    return _altura;
  }

  double calcularIMC(){
    return _peso / (_altura * _altura);
  }

  String getClassificacaoIMC(double imc){
    if (imc < 18.5) {
      return 'com o peso abaixo do normal';
    } else if (imc >= 18.5 && imc < 24.9) {
      return 'com o peso normal';
    } else if (imc >= 25.0 && imc < 29.9) {
      return 'com sobrepeso';
    } else if (imc >= 30.0 && imc < 34.9) {
      return 'com obesidade Grau 1';
    } else if (imc >= 35.0 && imc < 39.9) {
      return 'com obesidade Grau 2';
    } else {
      return 'com obesidade Grau 3';
    }
  }

}