
import 'dart:convert';

import 'package:api_flutter/utils/componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controllerclima = TextEditingController();
  GlobalKey<FormState> cform = GlobalKey<FormState>();

  String api_key ="bec91f7f";//
  String city  ="";
  String desc ="";
  String temp ="";
  String time  ="";
  String wind_speed ="";
  String humidity ="";
  //String state ="";








  buttonispressed() async{

    if(!cform.currentState.validate()) {
      print("cidade");
      print(controllerclima.text);
      String sauce = "https://api.hgbrasil.com/weather?array_limit=2&fields=only_results&key=$api_key&city_name=${controllerclima.text}";

      Response answ =await get(sauce);
      Map addr = json.decode(answ.body);

      setState(() {
        city = addr["city"];

        return print(addr);
      });

    } else{//pega ip
      print("IP");
      String sauce = "https://api.hgbrasil.com/weather?array_limit=2&fields=only_results&key=$api_key&user_ip=remote";

      Response answ =await get(sauce);
      final  addr = json.decode(answ.body) as Map;

      setState(() {
        city = addr['city'];
        return print(addr);

      });
     //

    }


  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(

        child: Form(
          key: cform,
          child: Column(

            children: [
              Container(
                child: Image.asset("assets/imgs/nuvem.jpg"),
                
                
              ),
              Componentes.caxatexto("Insira o local desejado ou deixe em branco", "EX: Garopaba,SC", controllerclima, null),
              Container(
                alignment: Alignment.center,
                height: size.height*0.2,
                child: IconButton(
                    icon: FaIcon(FontAwesomeIcons.globe,
                    color: Colors.blue,
                      size: 45,
                    ),
                    onPressed: buttonispressed,
                ),
              ),
              Componentes.cabomtexto(city),
            //  Componentes.cabomtexto(compl),
             // Componentes.cabomtexto(neigh),
             // Componentes.cabomtexto(city),
             // Componentes.cabomtexto(state),
            ],

          ),
        ),
      ),

    );
  }
}
