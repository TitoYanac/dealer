import 'dart:async';
import 'dart:ui';
import 'package:dealer/Bean/Bean_ficha.dart';
import 'package:http/http.dart' as http;
import 'package:dealer/Views/Empresa/Mapa/mapa.dart';
import 'package:dealer/constats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

class PopUpBody extends StatefulWidget {
  final String tipo;
  const PopUpBody({Key key, this.tipo}) : super(key: key);
  @override
  _PopUpBodyState createState() => _PopUpBodyState();
}

class _PopUpBodyState extends State<PopUpBody> {
  String idtipoenvio = "1";
  String idempresa = "2";
  String estado_ficha = "PENDIENTE";

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData;
  List<String> distritos = [
    'Ancón',
    'Ate Vitarte',
    'Barranco',
    'Breña',
    'Carabayllo',
    'Chaclacayo',
    'Chorrillos',
    'Cieneguilla',
    'Comas',
    'El Agustino',
    'Independencia',
    'Jesús María',
    'La Molina',
    'La Victoria',
    'Lima',
    'Lince',
    'Los Olivos',
    'Lurigancho',
    'Lurín',
    'Magdalena del Mar',
    'Miraflores',
    'Pachacamac',
    'Pucusana',
    'Pueblo Libre',
    'Puente Piedra',
    'Punta Hermosa',
    'Punta Negra',
    'Rímac',
    'San Bartolo',
    'San Borja',
    'San Isidro',
    'San Juan de Lurigancho',
    'San Juan de Miraflores',
    'San Luis',
    'San Martín de Porres',
    'San Miguel',
    'Santa Anita',
    'Santa María del Mar',
    'Santa Rosa',
    'Santiago de Surco',
    'Surquillo',
    'Villa El Salvador',
    'Villa María del Triunfo',
  ];
  List<String> countries = [
    'Peru',
    'Ecuador',
    'Venezuela',
  ];

  _PopUpBodyState() {
    formData = {
      'Distrito': 'Lima',
      'Pais': 'Peru',
    };
  }

  final _key_AceptarEnvio = GlobalKey<FormState>();

  final TextEditingController nombre_cliente = new TextEditingController();
  final TextEditingController apellido_cliente = new TextEditingController();
  final TextEditingController dni_cliente = new TextEditingController();
  final TextEditingController celular_cliente = new TextEditingController();
  final TextEditingController direccion_cliente = new TextEditingController();
  final TextEditingController distrito_cliente = new TextEditingController();
  final TextEditingController producto_cliente = new TextEditingController();
  final TextEditingController producto_size = new TextEditingController();
  final TextEditingController Estado_producto = new TextEditingController();
  final TextEditingController descripcion_producto =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _key_AceptarEnvio que creamos anteriormente
    return Form(
      key: _key_AceptarEnvio,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20, bottom: 0),
            child: Text(
              "Datos del Cliente:",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black54,
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Nombres",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value.isEmpty) return 'Ingrese el nombre del cliente';
                    },
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: kPrimaryColor)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.all(20),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: kPrimaryColor)),
                  ),
                  child: TextFormField(
                    controller: apellido_cliente,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Apellidos",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Ingrese su apellido del cliente';
                    },
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: kPrimaryColor))),
                  child: TextFormField(
                    controller: dni_cliente,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "DNI",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ingrese DNI del cliente';
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: kPrimaryColor))),
                  child: TextFormField(
                    controller: celular_cliente,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Celular",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ingrese numero de contacto del cliente';
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin:
                EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: kPrimaryColor))),
            child: TextFormField(
              controller: direccion_cliente,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Direccion",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Ingrese la dirección del cliente';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: kPrimaryColor,
              ),
            ),
            child: DropDownField(
              value: formData['Distrito'],
              icon: Icon(Icons.location_city),
              required: true,
              hintText: 'Escoge un Distrito',
              labelText: 'Distrito *',
              items: distritos,
              strict: false,
              setter: (dynamic newValue) {
                formData['Distrito'] = newValue;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20, bottom: 0),
            child: Text(
              "Datos del Producto:",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: kPrimaryColor))),
            child: TextFormField(
              controller: producto_cliente,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Producto que se envia",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Ingrese Item del envio';
                }
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: kPrimaryColor))),
                  child: TextFormField(
                    controller: producto_size,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Tamaño",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'grande | mediano | pequeño';
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: kPrimaryColor))),
                  child: TextFormField(
                    controller: Estado_producto,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Delicado",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'SI | NO';
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: kPrimaryColor))),
            child: TextFormField(
              controller: descripcion_producto,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Descripcion del producto",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Ingrese una breve descripcion';
                }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor),
              ),
              onPressed: () {
                // devolverá true si el formulario es válido, o falso si
                // el formulario no es válido.
                if (_key_AceptarEnvio.currentState.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Processing Data'),
                  ));

                  ficha objeto = new ficha(
                      nombre_cliente.text,
                      apellido_cliente.text,
                      dni_cliente.text,
                      celular_cliente.text,
                      direccion_cliente.text,
                      distrito_cliente.text,
                      producto_cliente.text,
                      Estado_producto.text,
                      descripcion_producto.text,
                      idtipoenvio,
                      idempresa,
                      estado_ficha);

                  Timer(
                      Duration(seconds: 2),
                      () => Navigator.of(context)
                          .pushReplacementNamed('/mapa', arguments: objeto));
                }
              },
              child: Text('INGRESAR ORIGEN Y DESTINO'),
            ),
          ),
        ],
      ),
    );
  }
/*
  Future RegistrarFicha(
      TextEditingController nombre_cliente,
      TextEditingController apellido_cliente,
      TextEditingController dni_cliente,
      TextEditingController celular_cliente,
      TextEditingController direccion_cliente,
      TextEditingController distrito_cliente,
      TextEditingController producto_cliente,
      TextEditingController estado_producto,
      TextEditingController descripcion_producto) async {
    var url = Uri.parse(
        'https://dealertesting.000webhostapp.com/registrar_ficha.php');
    var response = await http.post(url, body: {
      'nombre': nombre_cliente.text,
      'apellido': apellido_cliente.text,
      'dni': dni_cliente.text,
      'celular': celular_cliente.text,
      'direccion': direccion_cliente.text,
      'distrito': distrito_cliente.text,
      'producto': producto_cliente.text,
      'Estado': Estado_producto.text,
      'descripcion': descripcion_producto.text,
    });
    print(response.body);
  }*/

  Future<bool> buildFutures() async {
    return true;
  }
}
