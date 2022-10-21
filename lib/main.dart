import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultIMC = '';


  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      title: Text("Calculadora de IMC"),
      centerTitle: true,
    ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children:<Widget> [
              SizedBox(
                height: 16,
              ),

              TextFormField(
                controller: controllerPeso,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso",
                    hintText: "Digite seu peso",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(16.0)))),
              ),
              SizedBox(
                height: 16,
              ),

              TextFormField(
                controller: controllerAltura,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura",
                    hintText: "Digite sua Altura",
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(16.0)))),
              ),
              SizedBox(
                height: 32,
              ),


              Text(resultIMC, style:TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

              SizedBox(
                height: 32,
              ),

              Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    onPressed: (){
                      setState((){
                        num numAux =  (num.parse(controllerPeso.text) / ((num.parse(controllerAltura.text) * num.parse(controllerAltura.text))));
                        resultIMC = numAux.toStringAsFixed(5);
                      });
                    },
                    child: const Text('Calcular')),
              ),

              SizedBox(
                height: 32,
              ),
              Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    onPressed: (){
                      setState((){
                        resultIMC = '';

                      });
                    },
                    child: const Text('Limpar')),
              ),


            ]),
          ),
        ),
      ),
    );
  }
}
