import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key,required this.titulo});

  final String titulo;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {

  double _res=0;
  double _val1=0;
  String _Sres="";
  String _operador="";
  bool _punto=false;

  List<List<dynamic>> _simbolosTeclado=[
    [7,8,9,"/"],
    [4,5,6,"*"],
    [1,2,3,"-"],
    [".",0,"=","+"]
  ];

  Widget construirTeclado(BuildContext context) {
    List<Widget> columnas=[];
    for(int i=0;i<4;i++){
      List<Widget> botones=[];
      for(int j=0;j<4;j++){
        botones.add(
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.grey),
            ),
            color: Theme.of(context).colorScheme.inversePrimary,
            onPressed: (){
              _cambiarNumero(_simbolosTeclado[j][i]);
            },
            child: Text(
              _simbolosTeclado[j][i].toString(),
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          )
        );
      }
      columnas.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: botones,
        )
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: columnas,
    );
  }

  void _cambiarNumero(dynamic s){
    if(s is int){
      _Sres+=s.toString();
      setState(() {
        _res=double.parse(_Sres);
      });
    }
    if(s is String){
      if(s=="."){
        if(!_punto){
          _punto=true;
          _Sres += ".";
          setState(() {
            _res=double.parse(_Sres);
          });
        }
      }
      if(s == "/" || s == "*" || s == "-" || s == "+"){
        setState(() {
          _val1=_res;
          _res=0;
          _Sres="";
          _operador=s;
          s="";
          _punto=false;
        });
      }
      if(s=="="){
        if(_val1!=0){
          setState(() {
            if(_operador=="/"){
              _res=_val1/_res;
            }
            else if(_operador=="+"){
              _res=_val1+_res;
            }
            else if(_operador=="-"){
              _res=_val1-_res;
            }
            else if(_operador=="*"){
              _res=_val1*_res;
            }
          });
        }
      }
    }
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.titulo),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey,
              width: 320,
              child: Text(
                "$_res",
                style: TextStyle(
                  fontSize: 32,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            construirTeclado(context),
          ],
        ),
      ),
    );
  }
}
