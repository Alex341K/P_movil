import 'package:flutter/material.dart';

class Tarjetas extends StatefulWidget {
  Tarjetas({
    super.key,
    required this.nombres,
    required this.descripciones,
    required this.rutas,
    required this.height,
    required this.width,
    required this.color,
  });

  final List<String> nombres;
  final List<String> descripciones;
  final List<String> rutas;
  final double height;
  final double width;
  final Color color;

  @override
  State<Tarjetas> createState() => _TarjetasState();
}

class _TarjetasState extends State<Tarjetas> {
  final List<Widget> _tarjetas = [];

  void _crearTarjetas() {
    if (widget.nombres.isEmpty) {
      print("No hay datos");
      return;
    } else {
      if (widget.nombres.length != widget.descripciones.length ||
          widget.nombres.length != widget.rutas.length) {
        print("Error en tarjetas: Las listas no tienen la misma longitud");
        return;
      } else {
        setState(() {
          for (int i = 0; i < widget.nombres.length; i++) {
            _tarjetas.add(
              SizedBox(
                width: widget.width * 0.9,
                child: Card(
                  color: widget.color,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: widget.width / 5,
                        height: widget.height / 5,
                        child: ClipRRect(
                          child: Image.asset(widget.rutas[i], fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 50),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.nombres[i]),
                          Text(widget.descripciones[i]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _crearTarjetas();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _tarjetas,
    );
  }
}