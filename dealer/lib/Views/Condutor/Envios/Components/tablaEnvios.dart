import 'package:dealer/Bean/Bean_envios.dart';
import 'package:dealer/Views/Condutor/Envios/Components/popup.dart';
import 'package:dealer/Views/Condutor/Envios/Components/popup_body.dart';
import 'package:dealer/Views/Condutor/Envios/Components/popup_content.dart';

import 'package:dealer/constats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnviosConductor extends StatefulWidget {
  final List<envios> filas;
  const EnviosConductor({Key key, this.filas}) : super(key: key);
  @override
  _EnviosConductorState createState() => _EnviosConductorState();
}

class _EnviosConductorState extends State<EnviosConductor> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.filas.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.0,
              color: kSecondaryColor,
            ),
            boxShadow: [
              BoxShadow(
                color: kSecondaryColor.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset(
              widget.filas[index].TIPO == "EXPRESS"
                  ? "assets/icons/icon_moto.png"
                  : widget.filas[index].TIPO == "FLEXIBLE"
                      ? "assets/icons/icon_tipo2.png"
                      : "assets/icons/icon_tipo3.png",
              width: 60.0,
            ),
            title: Text(widget.filas[index].Nombre_Comercial,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            subtitle: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(child: Text(widget.filas[index].ORIGEN),width: 90,),
                      Icon(Icons.arrow_forward_sharp, size: 15),
                      Container(child: Text(widget.filas[index].DESTINO),width: 90,),
                    ],
                  ),
                ),
                Text(
                  widget.filas[index].TIPO == "EXPRESS"
                      ? "Tiempo Restante: 3 Horas"
                      : widget.filas[index].TIPO == "Flexible"
                          ? "Tiempo Restante: 72 horas"
                          : "Tiempo Restante: 42 horas",
                )
              ],
            ),
            dense: false,
            onTap: () {
              showPopup(context, PopUpBody(element: widget.filas[index]), widget.filas[index]);
            },
          ),
        );
      },
    );

  }

  showPopup(BuildContext context, Widget widget, envios fila, {BuildContext popupContext}  ) {

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
              title: Text("${fila.TIPO}",textAlign: TextAlign.right,),/*
              actions: [new Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    try {
                      Navigator.pop(context); //close the popup
                    } catch (e) {}
                  },
                );
              }),],*/
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
