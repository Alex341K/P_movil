import 'package:flutter/material.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key, required this.titulo}); // Parámetro requerido

  final String titulo; // Declaración correcta del campo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(titulo), // Usa "titulo" directamente (no "widget.titulo")
      ),
      body: const Center(
        child: Text(
          "¡Bienvenido/a!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}