import 'package:flutter/cupertino.dart' ;
import 'package:flutter/material.dart';

class Componentes {

  static cabomtexto (String text){

    return Text(
      text,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18 ),);

  }

  static caxatexto(String text,String hint,  TextEditingController controlador, valido, {bool obscure=false, bool num=false}){
    return TextFormField(

        controller: controlador,
        obscureText: obscure,
        validator: valido,
        keyboardType: num?TextInputType.number:TextInputType.text,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(fontSize: 16),
          hintText: hint,

        ),

    );


  }


  static botao (String text, Function f){
  return Container(
    child: RaisedButton(
      onPressed: f,
      child: Text(text,
      style: TextStyle(color: Colors.white,fontSize: 18 ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black, width: 4)
      ),
      color: Colors.black87.withOpacity(0.3),

    ),



  );




}


}