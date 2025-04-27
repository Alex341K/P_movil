import 'package:flutter/material.dart';
import 'package:movil/pantallas/calculadora.dart';
import 'package:movil/pantallas/principal.dart';
import 'package:movil/pantallas/bienvenida.dart';
import 'package:movil/pantallas/localizacion.dart';

class Navegador extends StatefulWidget {
  const Navegador({super.key});

  @override
  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador> {
  List<Widget> _pantallas = [];
  Widget? _cuerpo;
  int _p = 0; // Variable faltante para trackear la pantalla actual

  void _cambiaPantalla(int v) {
    setState(() {
      _p = v;
      _cuerpo = _pantallas[_p];
    });
  }

  @override
  void initState() {
    super.initState();
    _pantallas.add(const MyHomePage(title: "Pantalla principal"));
    _pantallas.add(const Bienvenida(titulo: "Bienvenida"));
    _pantallas.add(const Calculadora(titulo: "Calculadora"));
    _pantallas.add(const Localizacion(titulo: "tu localizacion"));
    _cuerpo = _pantallas[_p];
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cuerpo,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _p,
        onTap: _cambiaPantalla,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Principal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.waving_hand),
            label: "Bienvenida",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculadora",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on), // Icono más apropiado para localización
            label: "Localización",
          ),
        ],
      ),
    );
  }
}