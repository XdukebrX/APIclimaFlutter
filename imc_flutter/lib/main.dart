import 'package:imc_flutter/utils/componentes.dart';
import 'package:flutter/material.dart';
import 'package:imc_flutter/utils/componentes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String info = "Informe  os dados do baitola ai";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: criaPaginaPrincipal(),
    );
  }

  criaPaginaPrincipal() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcula IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: resetaCampos,
          ),
        ],
      ),
      body: criaFormularioIMC(),
    );
  }

  criaFormularioIMC() {
    return Form(
        key: cForm,
        child: Container(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Componentes.caxatexto("Peso", "O quao gordo é o baitola", controllerPeso, validaPeso, num: true),
        Componentes.caxatexto("Altura", "Bora ver se ele serve pra poste", controllerAltura, validaAltura, num: true),
        Componentes.botao("Calcular", calcularImc),
    Text(
    info,
    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
    ),
        ],
        ),
        ),
    );
  }

  Function validaPeso = ((value){
    if(value.isEmpty){
      return "FALA O PESSO DO CARA IMBECIL";
    }
    if(double.parse(value) <=0){
      return "PORRA O CARA NEM EXISTE COM ESSE PESSO";
    }
    return null;

  });

  Function validaAltura = ((value){
    if(value.isEmpty){
      return "FALA A ALTURA DO CARA IMBECIL";
    }
    if(double.parse(value) <=0){
      return "ESSSA MERDA FOI FEITA PRA CALCULAR ALTURA DE HUMANOS E NÃO O TAMANHO DO TEU PAU";
    }
    return null;

  });

  resetaCampos(){
    controllerPeso.text="";
    controllerAltura.text="";
    setState(() {
      info = "Informe os seus dados";
      cForm = GlobalKey<FormState>();
    });
  }

  calcularImc(){
    setState(() {
      if(!cForm.currentState.validate()){
        return null;
      }
      double p = double.parse(controllerPeso.text);
      double a = double.parse(controllerAltura.text);
      double imc = p/(a*a);
      if(imc < 18.5)
        info = "TA MAGRO VAI VISITAR TUA VO(${imc.toStringAsPrecision(4)})";
      else
      if(imc >= 18.5 && imc < 30)
        info = "FALEI Q IR VISITAR A VOZINHA IA AJUDAR (${imc.toStringAsPrecision(4)})";
      else
        info = "FICA UM TEMPO SEM IR PRA VO E VAI PRA ACADEMIA(${imc.toStringAsPrecision(4)})";
    });
  }

}
