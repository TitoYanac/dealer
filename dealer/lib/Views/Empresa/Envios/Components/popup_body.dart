import 'dart:async';
import 'dart:ui';
import 'package:dealer/Bean/Bean_ficha.dart';
import 'package:http/http.dart' as http;
import 'package:dealer/constats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopUpBody extends StatefulWidget {
  final String tipo;

  const PopUpBody({Key key, this.tipo}) : super(key: key);
  @override
  _PopUpBodyState createState() => _PopUpBodyState();
}

class Animal {
  final int id;
  final String name;

  Animal({
    this.id,
    this.name,
  });
}

class _PopUpBodyState extends State<PopUpBody> {

  List distritos = [
    "Ancón",
    "Ate Vitarte",
    "Barranco",
    "Breña",
    "Carabayllo",
    "Chaclacayo",
    "Chorrillos",
    "Cieneguilla",
    "Comas",
    "El Agustino",
    "Independencia",
    "Jesús María",
    "La Molina",
    "La Victoria",
    "Cercado de Lima",
    "Lince",
    "Los Olivos",
    "Lurigancho",
    "Lurín",
    "Magdalena del Mar",
    "Miraflores",
    "Pachacamac",
    "Pucusana",
    "Pueblo Libre",
    "Puente Piedra",
    "Punta Hermosa",
    "Punta Negra",
    "Rímac",
    "San Bartolo",
    "San Borja",
    "San Isidro",
    "San Juan de Lurigancho",
    "San Juan de Miraflores",
    "San Luis",
    "San Martín de Porres",
    "San Miguel",
    "Santa Anita",
    "Santa María del Mar",
    "Santa Rosa",
    "Santiago de Surco",
    "Surquillo",
    "Villa El Salvador",
    "Villa María del Triunfo",
  ];

  List<String> miUsuario;
  String tipoenvio = "";
  String idempresa = "";
  String estado_ficha = "PENDIENTE";
  String coord_origen = "";
  String coord_destino = "";

  String miDistrito = "";

  bool checkSize0 = false;
  bool checkSize1 = false;
  bool checkSize2 = false;
  bool checkSize4 = false;
  bool checkSize5 = false;

  String SizeProduct = "";
  String delicado = "";
  final _key_CrearEnvio = GlobalKey<FormState>();

  final TextEditingController nombre_cliente = new TextEditingController();
  final TextEditingController apellido_cliente = new TextEditingController();
  final TextEditingController dni_cliente = new TextEditingController();
  final TextEditingController celular_cliente = new TextEditingController();
  final TextEditingController direccion_cliente = new TextEditingController();
  final TextEditingController dist_cliente = new TextEditingController();
  String distrito_cliente;
  final TextEditingController producto_cliente = new TextEditingController();
  final TextEditingController producto_size = new TextEditingController();
  final TextEditingController Estado_producto = new TextEditingController();
  final TextEditingController descripcion_producto =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _key_AceptarEnvio que creamos anteriormente

    return Form(
      key: _key_CrearEnvio,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20, bottom: 0),
            child: Text(
              "Datos del Cliente:",
              style: TextStyle(
                fontSize: 24,
                color: kPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: TextFormField(
                    controller: nombre_cliente,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Nombres",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) { return value.isEmpty?'Campo obligatorio':null; },
                  ),
                  margin: EdgeInsets.all(20),
                ),
              ),
              Expanded(
                child: Container(
                  child: TextFormField(
                    controller: apellido_cliente,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Apellidos",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) { return value.isEmpty?'Campo obligatorio':null; },
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: dni_cliente,
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "DNI",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) { return value.isEmpty?'Campo obligatorio':null; },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: celular_cliente,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 9,
                    decoration: InputDecoration(
                      hintText: "Celular",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) { return value.isEmpty?'Campo obligatorio':null; },
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: TextFormField(
              controller: direccion_cliente,
              decoration: InputDecoration(
                hintText: "Direccion",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) { return value.isEmpty?'Campo obligatorio':null; },
            ),
            margin:
                EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 20),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 20),
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton(

              hint: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "-- Seleccionar Distrito --",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
              dropdownColor: Colors.white,
              icon: Icon(
                Icons.arrow_drop_down,
                color: kPrimaryColor,
              ),
              iconSize: 36,
              isExpanded: true,
              underline: SizedBox(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
              value: distrito_cliente,
              onChanged: (newValue) {
                setState(() {
                  distrito_cliente = newValue;
                });
              },
              items: [
                for (int i = 0; i < distritos.length; i++)
                  DropdownMenuItem(
                    value: "$i",
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "${distritos[i]}",
                        textAlign: TextAlign.center,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: kPrimaryColor),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20, bottom: 0),
            child: Text(
              "Datos del Producto:",
              style: TextStyle(
                fontSize: 24,
                color: kPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: producto_cliente,
              decoration: InputDecoration(
                hintText: "Producto que se envia",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) { return value.isEmpty?'Campo obligatorio':null; },
            ),
            margin: EdgeInsets.all(20.0),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: descripcion_producto,
              decoration: InputDecoration(
                hintText: "Descripcion del producto",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) { return value.isEmpty?'Campo obligatorio':null; },
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Tamaño:",
                        style: TextStyle(color: Colors.grey),
                      ),
                      CheckboxListTile(
                          value: checkSize0,
                          checkColor: Colors.white,
                          activeColor: kPrimaryColor,
                          title: Text(
                            "Grande",
                            style: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (bool value) {
                            setState(() {
                              checkSize0 = true;
                              checkSize1 = false;
                              checkSize2 = false;
                              SizeProduct = "grande";
                            });
                          }),
                      CheckboxListTile(
                          value: checkSize1,
                          checkColor: Colors.white,
                          activeColor: kPrimaryColor,
                          title: Text(
                            "Mediano",
                            style: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (bool value) {
                            setState(() {
                              checkSize0 = false;
                              checkSize1 = true;
                              checkSize2 = false;
                              SizeProduct = "mediano";
                            });
                          }),
                      CheckboxListTile(
                          value: checkSize2,
                          checkColor: Colors.white,
                          activeColor: kPrimaryColor,
                          title: Text(
                            "Pequeño",
                            style: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (bool value) {
                            setState(() {
                              checkSize0 = false;
                              checkSize1 = false;
                              checkSize2 = true;
                              SizeProduct = "pequeño";
                            });
                          }),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Text(
                      "Delicado:",
                      style: TextStyle(color: Colors.grey),
                    ),
                    CheckboxListTile(
                        value: checkSize4,
                        checkColor: Colors.white,
                        activeColor: kPrimaryColor,
                        title: Text(
                          "SI",
                          style: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (bool value) {
                          setState(() {
                            checkSize4 = true;
                            checkSize5 = false;
                            delicado = "si";
                          });
                        }),
                    CheckboxListTile(
                        value: checkSize5,
                        checkColor: Colors.white,
                        activeColor: kPrimaryColor,
                        title: Text(
                          "NO",
                          style: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (bool value) {
                          setState(() {
                            checkSize4 = false;
                            checkSize5 = true;
                            delicado = "no";
                          });
                        }),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor),
              ),
              onPressed: () {
                if (_key_CrearEnvio.currentState.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Creando Envío!")));

                  CrearFicha();
                }
              },
              child: Text('INGRESAR ORIGEN Y DESTINO'),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> buildFutures() async {
    return true;
  }

  CrearFicha() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    miUsuario = preferences.getStringList('miUsuario');
    idempresa = miUsuario[0];

    tipoenvio = widget.tipo == "EXPRESS"
        ? "1"
        : widget.tipo == "SAME DAY"
            ? "2"
            : "3";

    ficha objeto = new ficha(
      nombre_cliente.text,
      apellido_cliente.text,
      dni_cliente.text,
      celular_cliente.text,
      direccion_cliente.text,
      distrito_cliente,
      producto_cliente.text,
      descripcion_producto.text,
      SizeProduct,
      delicado,
      tipoenvio,
      idempresa,
      estado_ficha,
      coord_origen,
      coord_destino,
      '',
      '',
    );

    Timer(
        Duration(seconds: 1),
            () => Navigator.of(context)
            .pushReplacementNamed('/mapa', arguments: objeto));

  }
}
