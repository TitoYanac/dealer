import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dealer/constats.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Realizados/popup.dart';
import 'Realizados/popup_body.dart';
import 'Realizados/popup_content.dart';

class EnviosRealizados extends StatefulWidget {
  @override
  _EnviosRealizadosState createState() => _EnviosRealizadosState();
}

class _EnviosRealizadosState extends State<EnviosRealizados> {

  Future cargarEnviosEnEspera() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> empresa = preferences.getStringList('miUsuario');

    var url = Uri.parse(
        'https://dealertesting.000webhostapp.com/App_modulos_empresa/App_mostrar_envios_realizados.php');
    var response = await http.post(url, body: {'id_Empresa': empresa[0]});
    return response;
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: cargarEnviosEnEspera(),
      builder: (context, response) {
        if (response.connectionState == ConnectionState.done) {
          var data = json.decode(response.data.body);
          if (data[0]['FALSE'] != null && data[0]['FALSE'] == '0') {
            return Container(
              child: Center(
                  child: Text(
                    "NO HAY ENVÍOS FINALIZADOS",
                    style: TextStyle(fontSize: 24, color: kPrimaryColor),
                  )),
            );
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
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
                    leading: data[index]['TIPO']=="EXPRESS"?Image.asset("assets/icons/icon_moto.png"):data[index]['TIPO']=="SAME DAY"?Image.asset("assets/icons/icon_tipo2.png"):Image.asset("assets/icons/icon_tipo3.png"),
                    title: Text("${data[index]['EMPRESA'].toUpperCase()}",style: TextStyle(fontWeight: FontWeight.bold,),),
                    subtitle: Text("${miDistrito[int.parse(data[index]['ORIGEN_ID_DISTRITO'])]} → ${miDistrito[int.parse(data[index]['DESTINO_ID_DISTRITO'])]}"),
                    trailing: Text("${DateTime.parse(data[index]['FECHA_CREACION']).add(Duration(hours: 3)).difference(DateTime.now())}"),
                    dense: true,
                    onTap: (){
                      showPopup(context, PopUpBody(element: data[index]), data[index]);
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
  showPopup(BuildContext context, Widget widget, Map<String, String> fila,
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
              title: Row(
                children: [
                  Text("${miDistrito[int.parse(fila['ORIGEN_ID_DISTRITO'])]}"),
                  Expanded(
                      child: Center(
                          child: Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.white,
                          ))),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "${miDistrito[int.parse(fila['DESTINO_ID_DISTRITO'])]}",
                        textAlign: TextAlign.right,
                      )),
                ],
              ),
              leading: new Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.close),
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
