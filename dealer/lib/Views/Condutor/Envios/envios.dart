import 'dart:convert';

import 'package:dealer/Bean/Bean_envios.dart';
import 'package:dealer/Views/Condutor/Envios/Components/tablaEnvios.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Envios extends StatefulWidget {
  @override
  _EnviosState createState() => _EnviosState();
}

class _EnviosState extends State<Envios> {
  List<envios> ListaEnvios = [];

  Future<List<envios>> cargarEnvios() async {
    var url = Uri.parse(
        'https://dealertesting.000webhostapp.com/conductor_CargarEnviosDisponibles.php');
    var response = await http.get(url);

    var data = json.decode(response.body);

    List<envios> aux = [];

    for(var e in data){
      aux.add(envios.fromJson(e));
    }
    return aux;
  }

  @override
  void initState() {
    cargarEnvios().then((value){
      setState(() {
        ListaEnvios.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      //child: Container(),
      child: EnviosConductor(filas: ListaEnvios),
    );
  }
}



