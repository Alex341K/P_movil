import 'package:flutter/material.dart';
import 'package:movil/pantallas/tarjetas.dart';

class Bienvenidas extends StatefulWidget{
  const Bienvenidas({super.key, required this.titulo});

  final String titulo;
  @override
  State<Bienvenidas> createState() => _BienvenidasState();

}

class _BienvenidasState extends State<Bienvenidas> {

  @override
  void initState(){
    super.initState();
  }
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:Text("Hola"),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Tarjetas(
            width: 500,
            height: 600,
            color: Colors.blueGrey,
            nombres:["Tusini Tusineli", "Perro fachero","Plankton","Tusini Tusineli", "Perro fachero","Plankton"],
            descripciones: ["En la playa con las bendiciones","Tirando estilo","*Traumado*","En la playa con las bendiciones","Tirando estilo","*Traumado*"],
            rutas: ["assets/images/tusini.jpg",
                    "assets/images/facha.jpg",
                    "assets/images/plankton.webp",
                    "assets/images/tusini.jpg",
                    "assets/images/facha.jpg",
                    "assets/images/plankton.webp"],
          ),
        ),
      ));
  }
}