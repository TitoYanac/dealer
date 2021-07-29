import 'dart:convert';
import 'package:dealer/Bean/Bean_empresa_ficha_pendiente.dart';
import 'package:http/http.dart' as http;
import 'package:dealer/constats.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pendientes/popup.dart';
import 'Pendientes/popup_body.dart';
import 'Pendientes/popup_content.dart';

class EnviosPendientes extends StatefulWidget {
  @override
  _EnviosPendientesState createState() => _EnviosPendientesState();
}

class _EnviosPendientesState extends State<EnviosPendientes> {
  List<String> empresa = [];

  Future cargarEnviosEnEspera() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    empresa = preferences.getStringList('miUsuario');
    var url = Uri.parse(
        'https://dealertesting.000webhostapp.com/App_modulos_empresa/App_mostrar_envios_asignados.php');
    var response = await http.post(url, body: {'id_Empresa': empresa[0]});

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cargarEnviosEnEspera(),
      builder: (context, response) {
        if (response.connectionState == ConnectionState.done) {
          print(empresa);
          print("response.data.body: ${response.data.body}");
          var data = json.decode(response.data.body);
          print(data);
          if (data[0]['FALSE'] != null && data[0]['FALSE'] == '0') {
            return Container(
              child: Center(
                  child: Text(
                    "NO HAY ENVÍOS DISPONIBLES",
                    style: TextStyle(fontSize: 24, color: kPrimaryColor),
                  )),
            );
          } else if (data[0]['FALSE'] == '1') {
            return Container(
              child: Center(
                  child: Text(
                    "ERROR EN EL SERVIDOR\nNO SE PUDO OBTENER INFORMACIÓN",
                    style: TextStyle(fontSize: 24, color: kPrimaryColor),
                  )),
            );
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var fecha = data[index]['fecha_creacion_ficha'].split(" ");
                String day = fecha[0];
                String hour = fecha[1];

                empresa_ficha_pendiente ficha_pendiente = new empresa_ficha_pendiente.fromJson(data[index]);
                return Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: kSecondaryColor.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: data[index]['TIPO'] == "EXPRESS"
                        ? Image.asset("assets/icons/icon_moto.png")
                        : data[index]['TIPO'] == "SAME DAY"
                            ? Image.asset("assets/icons/icon_tipo2.png")
                            : Image.asset("assets/icons/icon_tipo3.png"),
                    title: Text(
                      "${data[index]['producto'].toUpperCase()}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                  "Lugar del Envío: ${data[index]['distrito_comprador']}"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(child: Text("Cliente: ${data[index]['nombre_comprador']} ${data[index]['apellido_comprador']}")),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("${hour}"),
                        Text("${day}"),
                      ],
                    ),
                    //"${DateTime.parse(data[index]['fecha_creacion_ficha']).add(Duration(hours: 3)).difference(DateTime.now())}"),
                    dense: false,
                    onTap: () {
                      showPopup(context, PopUpBody(element: ficha_pendiente),ficha_pendiente);
                    },
                  ),
                );
              },
            );
          }
        } else {
          return Center(
            child: Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
              ),
            ),
          );
        }
      },
    );
  }

  showPopup(BuildContext context, Widget widget, empresa_ficha_pendiente ficha,
      {BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupLayout(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: PopupContent(
          content: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: Container(padding:EdgeInsets.only(right: 20),width:double.infinity,child: Text("DELIVERY CREADO POR ",style: TextStyle(color: Colors.white,fontSize: 24),textAlign: TextAlign.right,)),
              leading: new Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.close),color: Colors.white,iconSize: 40,
                  onPressed: () {
                    try {
                      Navigator.pop(context); //close the popup
                    } catch (e) {}
                  },
                );
              }),
              brightness: Brightness.light,
            ),
            // resizeToAvoidBottomPadding: false,
            body: widget,
          ),
        ),
      ),
    );
  }
}
