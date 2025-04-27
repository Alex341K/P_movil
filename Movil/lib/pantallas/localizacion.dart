import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Localizacion extends StatelessWidget {
  const Localizacion({super.key, required this.titulo});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(titulo),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Localización",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                print("Aquí obtiene la localización");
              },
              color: Theme.of(context).colorScheme.inversePrimary,
              child: const Text(
                "Obtener coordenadas",
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Longitud",
              style: TextStyle(fontSize: 38),
            ),
          ],
        ),
      ),
    );
  }
}