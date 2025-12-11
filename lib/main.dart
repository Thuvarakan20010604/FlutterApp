import 'package:flutter/material.dart';

void main() {
String data="Spectaculase";
 runApp(MaterialApp(
  home:Scaffold(
    appBar: AppBar(
      title: Text(data,style: TextStyle(color: const Color.fromARGB(255, 5, 42, 73)),),
      backgroundColor: Colors.amberAccent,
      centerTitle: false,
    ),
    body:Center(
      child:Container(
        
        height: 150,
        width: 200,
        alignment: Alignment.center,
        decoration:BoxDecoration(
          color: const Color.fromARGB(255, 33, 95, 146),
          borderRadius:BorderRadius.circular(10)
        ) ,
        child:Container(
          height:120,
          width:120,
           alignment: Alignment.center,
         decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
         ),
          child:Text(data,style: TextStyle(color: const Color.fromARGB(255, 225, 234, 242),fontWeight:FontWeight.bold))
        ),
        
        
      )
    )
 )));
 
 
}
