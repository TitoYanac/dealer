import 'dart:async';

import 'package:dealer/constats.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  bool _checked;
  @override
  void initState() {
    _checked = false;
    super.initState();
  }
  final TextEditingController nombre_empresa = new TextEditingController();
  final TextEditingController razon_empresa = new TextEditingController();
  final TextEditingController correo_empresa = new TextEditingController();
  final TextEditingController ruc_empresa = new TextEditingController();
  final TextEditingController direccion_empresa = new TextEditingController();
  final TextEditingController interior_empresa = new TextEditingController();
  final TextEditingController celular_empresa = new TextEditingController();
  final TextEditingController pass1_empresa = new TextEditingController();
  final TextEditingController pass2_empresa = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: kPrimaryColor))
            ),
            child: TextFormField(
              controller: nombre_empresa,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "NOMBRE COMERCIAL",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese su nombre comercial';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: kPrimaryColor))
            ),
            child: TextFormField(
              controller: razon_empresa,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "RAZÓN SOCIAL",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Ingrese su razon social';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: kPrimaryColor))
            ),
            child: TextFormField(
              controller: ruc_empresa,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "RUC",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese ruc';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: kPrimaryColor))
            ),
            child: TextFormField(
              controller: correo_empresa,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "CORREO",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese un correo de contacto';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: kPrimaryColor))
            ),
            child: TextFormField(
              controller: direccion_empresa,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "DIRECCIÓN",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese dirección';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: kPrimaryColor))
            ),
            child: TextFormField(
              controller: interior_empresa,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "INTERIOR",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Ingrese # si la empresa ocupa todo el terreno';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: kPrimaryColor))
            ),
            child: TextFormField(
              controller: celular_empresa,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "CELULAR",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese un número de contacto';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: kPrimaryColor))
            ),
            child: TextFormField(
              controller: pass1_empresa,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "CONTRASEÑA",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese una contraseña';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: kPrimaryColor))
            ),
            child: TextFormField(
              controller: pass2_empresa,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "CONFIRMAR CONTRASEÑA",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Las contraseñas no coinciden o esta vacío';
                }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
              ),
              onPressed: () {
                // devolverá true si el formulario es válido, o falso si
                // el formulario no es válido.
                if (_formKey.currentState.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Processing Data'),
                  ));
                  Timer(Duration(seconds: 5),()=>Navigator.of(context).pushReplacementNamed('/login'));

                }else{
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Revise los datos ingresados!'),
                  ));                }
              },
              child: Text('GUARDAR CAMBIOS'),
            ),
          ),
        ],
      ),
    );
  }
}
