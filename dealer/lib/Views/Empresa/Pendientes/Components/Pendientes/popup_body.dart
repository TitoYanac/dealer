
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dealer/Bean/Bean_empresa_ficha_pendiente.dart';
import 'package:dealer/constats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopUpBody extends StatefulWidget {
  final empresa_ficha_pendiente element;
  const PopUpBody({Key key, this.element}) : super(key: key);
  @override
  _PopUpBodyState createState() => _PopUpBodyState();
}

class _PopUpBodyState extends State<PopUpBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      child: Text(
                        "${widget.element.nombre_empresa.toUpperCase()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: kPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor, width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        subTituloPopUp("FECHA DE CREACIÓN DEL ENVÍO:"),
                        textoNornalPopUp(
                            "${widget.element.fecha_creacion_ficha}"),
                        subTituloPopUp("ESTADO DEL ENVÍO:"),
                        textoNornalPopUp("${widget.element.estado}"),
                        subTituloPopUp("TIPO DE DELIVERY:"),
                        textoNornalPopUp("${widget.element.tipoenvio}"),
                        subTituloPopUp("COSTO DEL SERVICIO:"),
                        textoNornalPopUp("S/. ${widget.element.monto}.00"),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 50,
                      top: 10,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 3, bottom: 3, left: 10, right: 10),
                        color: kPrimaryColor,
                        child: Text(
                          'DETALLES DEL SERVICIO',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor, width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        subTituloPopUp("NOMBRE:"),
                        textoNornalPopUp(
                            "${widget.element.nombre_comprador} ${widget.element.apellido_comprador}"),
                        subTituloPopUp("DOCUMENTO NACIONAL DE IDENTIDAD:"),
                        textoNornalPopUp(
                            "${widget.element.documento_comprador}"),
                        subTituloPopUp("CELULAR:"),
                        textoNornalPopUp("${widget.element.celular_comprador}"),
                        subTituloPopUp("DIRECCIÓN DONDE SE LLEVARÁ EL ENVÍO:"),
                        textoNornalPopUp(
                            "${widget.element.direccion_comprador}"),
                        subTituloPopUp("DISTRITO DE DESTINO:"),
                        textoNornalPopUp(
                            "${widget.element.distrito_comprador}"),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 50,
                      top: 10,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 3, bottom: 3, left: 10, right: 10),
                        color: kPrimaryColor,
                        child: Text(
                          'DATOS DEL CLIENTE',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor, width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        subTituloPopUp("ITEM QUE SE ESTA ENVIANDO:"),
                        textoNornalPopUp("${widget.element.producto}"),
                        subTituloPopUp("DESCRIPCIÓN DE LO QUE SE ENVÍA:"),
                        textoNornalPopUp("${widget.element.descripcion}"),
                        subTituloPopUp("TAMAÑO DEL PAQUETE:"),
                        textoNornalPopUp("${widget.element.SizeProduct}"),
                        subTituloPopUp("¿EL ITEM QUE SE ENVÍA ES DELICADO?:"),
                        textoNornalPopUp("${widget.element.delicado}"),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 50,
                      top: 10,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 3, bottom: 3, left: 10, right: 10),
                        color: kPrimaryColor,
                        child: Text(
                          'DATOS DEL PRODUCTO',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        eliminarFicha();
                      },
                      child: Text("Cancelar Envío!"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(255, 0, 0, 0.8)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(12, 8, 12, 8)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 24))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        try {
                          Navigator.pop(context); //close the popup
                        } catch (e) {}
                      },
                      child: Text("Todo OK!"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(12, 8, 12, 8)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 24))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Future eliminarFicha() async{

    var url = Uri.parse(
        'https://dealertesting.000webhostapp.com/App_modulos_empresa/App_eliminar_envio.php');
    var response = await http.post(url, body: {'id_ficha': widget.element.id_ficha});
print(response.body);
    var data = json.decode(response.body);
    print(data);
    print(data["0"]);
    if (data["0"]=="1"){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Se Eliminó correctamente el Envío."),
        ),
      );
      Timer(Duration(seconds: 1), () => Navigator.of(context).pushNamed('/principal_empresa', arguments: '1'));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Tenemos problemas con el servidor! \n Intentelo más tarde."),
        ),
      );
    }

  }
}



class tituloPopUp extends StatelessWidget {
  tituloPopUp(String this.titulo);
  String titulo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            "$titulo",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}

class subTituloPopUp extends StatelessWidget {
  subTituloPopUp(String this.subtitulo);
  String subtitulo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          child: Text(
            "$subtitulo",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ),
      ],
    );
  }
}

class textoNornalPopUp extends StatelessWidget {
  textoNornalPopUp(String this.texto);
  String texto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 4, 8, 4),
          child: Text(
            "$texto",
            style: TextStyle(fontSize: 16, color: Colors.black45),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: kPrimaryColor, width: 2),
              right: BorderSide(color: kPrimaryColor, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
