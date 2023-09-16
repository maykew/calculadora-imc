import 'package:flutter/material.dart';

import 'classes/Pessoa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  void _calcularIMC() {
    String nome = nomeController.text;
    double altura = double.tryParse(alturaController.text) ?? 0.0;
    double peso = double.tryParse(pesoController.text) ?? 0.0;

    Pessoa pessoa = Pessoa(nome, peso, altura);

    double imc = pessoa.calcularIMC();
    String classificacaoIMC = pessoa.getClassificacaoIMC(imc);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              
              Text('${pessoa.getNome()}, seu IMC é de ${imc.toStringAsFixed(2)} e isso significa que você esta $classificacaoIMC'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: alturaController,
              decoration: const InputDecoration(labelText: 'Altura (metro e cm)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: pesoController,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: _calcularIMC,
                child: const Text('Calcular IMC'),
              ),
          ],
        ),
      ),
    );
  }
}
