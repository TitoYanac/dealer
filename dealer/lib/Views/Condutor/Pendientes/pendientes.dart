import 'dart:convert';

import 'package:dealer/Views/Condutor/Pendientes/Components/tablaPendientes.dart';
import 'package:dealer/Views/Condutor/Pendientes/Components/tablaRealizados.dart';
import 'package:dealer/constats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Pendientes extends StatefulWidget {
  @override
  _PendientesState createState() => _PendientesState();
}

class _PendientesState extends State<Pendientes> {

  List<Map<String, String>> pendientes = [
    {
      "origen": "LA MOLINA",
      "destino": "S.J.L.",
      "tipo": "EXPRESS",
      "empresa": "SODIMAC",
      "t_restamte": "01:41",
    },
  ];
  List<Map<String, String>> realizados = [
    {
      "origen": "C. DE LIMA",
      "f_entrega": "21/03/2021 18:42",
      "destino": "S.J.L.",
      "tipo": "NEXT DAY",
      "empresa": "SODIMAC S.A."
    },
    {
      "origen": "C. DE LIMA",
      "f_entrega": "21/03/2021 18:42",
      "destino": "S.J.L.",
      "tipo": "EXPRESS",
      "empresa": "SODIMAC S.A."
    },
    {
      "origen": "C. DE LIMA",
      "f_entrega": "21/03/2021 18:42",
      "destino": "S.J.L.",
      "tipo": "FLEXIBLE",
      "empresa": "SODIMAC S.A."
    },
    {
      "origen": "C. DE LIMA",
      "f_entrega": "21/03/2021 18:42",
      "destino": "S.J.L.",
      "tipo": "EXPRESS",
      "empresa": "SODIMAC S.A."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ConseguirDatos(),
        builder: (context,response){
      if(response.connectionState == ConnectionState.done){
        //return Container( child: Text("${response.data}"),);
        if (response.data == null ) {
          return Container(
            child: Center(
                child: Text(
                  "NO HAY ENVÍOS PENDIENTES",
                  style: TextStyle(fontSize: 24, color: kPrimaryColor),
                )),
          );
        } else {
          return Container();
        }
        /*
        *
        var data = json.decode(response.data.body);

        if (data[0]['FALSE'] != null && data[0]['FALSE'] == '0') {
          return Container(
            child: Center(
                child: Text(
                  "NO HAY ENVÍOS DISPONIBLES",
                  style: TextStyle(fontSize: 24, color: kPrimaryColor),
                )),
          );
        } else {
          return Container();
        }
        * */
      }else{
        return CircularProgressIndicator();
      }
    });
  }

  Future ConseguirDatos() async {
    var url = Uri.parse('https://dealertesting.000webhostapp.com/App_modulos_conductor/App_mostrar_envios_en_proceso.php');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var response = http.post(url, body: { 'id_Conductor': preferences.getStringList('miUsuario') });
    print(response);
    return response;
  }
}
/*
*
* ListView(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 25,
            left: 15.0,
            right: 15.0,
            bottom: 0.0,
          ),
          child: Text(
            "ENVÍOS PENDIENTES",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(15.0),
          child: DataTablePendientes(filas: pendientes),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 25,
            left: 15.0,
            right: 15.0,
            bottom: 0.0,
          ),
          child: Text(
            "ENVÍOS REALIZADOS",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(15.0),
          child: DataTableRealizados(filas: realizados),
        ),
      ],
    )
* */

