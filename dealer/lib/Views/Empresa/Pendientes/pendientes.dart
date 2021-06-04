import 'package:dealer/Views/Empresa/Pendientes/Components/tablaPendientes.dart';
import 'package:dealer/Views/Empresa/Pendientes/Components/tablaRealizados.dart';
import 'package:dealer/Views/Empresa/Pendientes/testing.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Pendientes extends StatefulWidget {
  @override
  _PendientesState createState() => _PendientesState();
}

class _PendientesState extends State<Pendientes> {
  List<Map<String, String>> pendientes = [
    {
      "origen": "LA MOLINA",
      "t_restamte": "01:41",
      "destino": "S.J.L.",
      "tipo": "EXPRESS",
      "empresa": "SODIMAC S.A."
    },
  ];
  List<Map<String, String>> realizados = [
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
      "tipo": "EXPRESS",
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
      "tipo": "EXPRESS",
      "empresa": "SODIMAC S.A."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
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
        FutureBuilder(
            future:   ConseguirDatos(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return Container(
                  margin: EdgeInsets.all(15.0),
                  child: DataTablePendientes(filas: pendientes),
                );
              }else{
                return CircularProgressIndicator();
              }
            })
        ,

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
    );
  }

  Future ConseguirDatos() async {
    var url = Uri.parse('https://dealertesting.000webhostapp.com/empresa/Mostrar_EnviosPendientes.php');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> Empresa = preferences.getStringList('miUsuario');
    var response = await http.post(url, body: { 'idEmpresa': Empresa[0] });
    List<dynamic> milista = json.decode(response.body);


      pendientes = [];

    for(var item in milista){
      Map<String,String> aux = new Map<String,String>();
      aux['ID_FICHA']=item['ID_FICHA'].toString();
      aux['ID_Empresa']=item['ID_Empresa'];
      aux['ORIGEN']=item['ORIGEN'];
      aux['DESTINO']=item['DESTINO'];
      aux['TIPO']=item['TIPO'];
      aux['FECHA_CREACION']=item['FECHA_CREACION'];
      aux['ESTADO']=item['ESTADO'];
      aux['CLIENTE_NOMBRE']=item['CLIENTE_NOMBRE'];
      aux['CLIENTE_APELLIDO']=item['CLIENTE_APELLIDO'];
      pendientes.add(aux);
    }


    return json.decode(response.body);
  }





}


/*
*
* */