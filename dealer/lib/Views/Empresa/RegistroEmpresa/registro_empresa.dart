import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dealer/constats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistroEmpresa extends StatefulWidget {
  final String data;
  const RegistroEmpresa({Key key, this.data}) : super(key: key);
  @override
  _RegistroEmpresaState createState() => _RegistroEmpresaState();
}

class _RegistroEmpresaState extends State<RegistroEmpresa> {
  bool _passwordVisible;
  bool _passwordVisible2;
  String _distrito = "";

  bool _checked;

  final _formRegistroEmpresa = GlobalKey<FormState>();

  TextEditingController nombre_comercial;
  TextEditingController razon;
  TextEditingController ruc;
  TextEditingController correo;
  TextEditingController direccion;
  TextEditingController cantidad;
  TextEditingController celular;
  TextEditingController pass1;
  TextEditingController pass2;
  TextEditingController resena;
  String tipo;
  String terminos;
  TextEditingController id_distrito;
  String estado_cuenta;

  @override
  void initState() {
    _passwordVisible = false;
    _passwordVisible2 = false;
    _checked = false;

    nombre_comercial = new TextEditingController();
    razon = new TextEditingController();
    ruc = new TextEditingController();
    correo = new TextEditingController();
    direccion = new TextEditingController();
    cantidad = new TextEditingController();
    celular = new TextEditingController();
    pass1 = new TextEditingController();
    pass2 = new TextEditingController();
    resena = new TextEditingController();
    tipo = "0";
    terminos = "0";
    id_distrito = new TextEditingController();
    estado_cuenta = "0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          widget.data,
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "assets/icons/icon_close.png",
              color: kPrimaryColor,
              height: 20,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Form(
            key: _formRegistroEmpresa,
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/icons/market_icon.png",
                  width: 200,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextFormField(
                          controller: nombre_comercial,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            hintText: "NOMBRE COMERCIAL",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            return value.isEmpty ? 'Campo Obligatorio' :RegExp(r'[!@.°{}©®™✓%•√π÷×¶∆£¢€¥$#<>?":_`~;[\]\\|=+)(*&^%0-9]').hasMatch(value)? 'Nombre no válido':null;
                          },
                        ),
                      ),
                    ),


                    Flexible(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: cantidad,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            hintText: "Num.Envios.Aprox",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),






                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: razon,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    hintText: "RAZÓN SOCIAL",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    return value.isEmpty ?  'Campo Obligatorio' :RegExp(r'[!@°{}©®™✓%•√π÷×¶∆£¢€¥$#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)? 'Nombre no válido':null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: ruc,
                          keyboardType: TextInputType.number,
                          maxLength: 11,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            hintText: "RUC",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            return value.isEmpty ? 'Campo Obligatorio' : !RegExp(r"^([0-9])*$").hasMatch(value)?'Solo números': value.length!=11?'Son 11 Dígitos':null;
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: celular,
                          maxLength: 9,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            hintText: "CELULAR",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            return value.isEmpty ? 'Campo Obligatorio' : !RegExp(r"^([0-9])*$").hasMatch(value)?'Solo números': value.length!=9?'Son 9 Dígitos':null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextFormField(
                          controller: direccion,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            hintText: "DIRECCIÓN",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            return value.isEmpty ? 'Campo Obligatorio' : null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    iconSize: 40,
                    iconEnabledColor: kPrimaryColor,
                    value: _distrito == "" ? null : _distrito,
                    items: miDistrito.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(
                            value,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _distrito = newValue;
                      });
                    },
                    hint: Center(
                      child: Text(
                        "-- Seleccionar Distrito --",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        child: TextFormField(
                          controller: correo,
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            hintText: "CORREO",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            return value.isEmpty ? 'Campo Obligatorio' : RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)?null:'Correo no válido';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: pass1,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: kPrimaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: pass2,
                  obscureText: !_passwordVisible2,
                  decoration: InputDecoration(
                    labelText: 'Confirmar contraseña',
                    labelStyle: TextStyle(color: kPrimaryColor),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible2
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible2 = !_passwordVisible2;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CheckboxListTile(
                    title: Text(
                      "Acepto los Términos y Condiciones de Delaer para el tratamiento de mis datos.",
                    ),
                    secondary: Icon(
                      Icons.beach_access,
                      color: _checked ? kPrimaryColor : Colors.grey,
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _checked,
                    onChanged: (bool value) {
                      setState(() {
                        _checked = value;
                        if(_checked){
                          terminos = "1";
                        }else{
                          terminos = "0";
                        }
                      });
                    },
                    activeColor: kPrimaryColor,
                    checkColor: Colors.white,
                    dense: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor),
                  ),
                  onPressed: () {
                    if (_formRegistroEmpresa.currentState.validate()) {
                      if (pass1.text != pass2.text) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Las contraseñas no coinciden.")));
                      } else if (_checked) {
                        registrarEmpresa();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Acepte nuestros términos y condiciones.")));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Complete todos lo Campos Obligatorios.")));
                    }
                  },
                  child: Text('REGISTRAR EMPRESA'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future registrarEmpresa() async {



    print("nombre_comercial : ${nombre_comercial.text}");
    print("razon : ${razon.text}");
    print("ruc : ${ruc.text}");
    print("correo : ${correo.text}");
    print("direccion : ${direccion.text}");
    print("cantidad : ${cantidad.text}");
    print("celular : ${celular.text}");
    print("pass1 : ${pass1.text}");
    print("pass2 : ${pass2.text}");
    print("resena : ${resena.text==""?"Sin reseña":resena.text}");
    print("tipo : ${tipo}");
    print("terminos : ${terminos}");
    print("id_distrito : ${miDistrito.indexOf(_distrito) + 1}");
    print("estado_cuenta : ${estado_cuenta}");
    print("_distrito : ${_distrito}");


    var url = Uri.parse(
        'https://dealertesting.000webhostapp.com/App_modulos_empresa/App_registrar_empresa.php');
    var response = await http.post(url, body: {
      'nombre_comercial' : nombre_comercial.text,
      'razon' : razon.text,
      'ruc' : ruc.text,
      'correo' : correo.text,
      'direccion' : direccion.text,
      'cantidad' : cantidad.text,
      'celular' : celular.text,
      'pass' : pass1.text,
      'resena' : resena.text==""?"Sin reseña":resena.text,
      'tipo' : tipo,
      'terminos' : terminos,
      'id_distrito' : "${miDistrito.indexOf(_distrito) + 1}",
      'estado_cuenta' : estado_cuenta
    });


    var data = response.body==""?{'0':'-1'}:json.decode(response.body);
    print(data);
    print("${data['0']}");

    switch("${data['0']}"){
      case "0":
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("No se pudo registrar \nMotivo: El correo ya ha sido registrado"),
          ),
        );
        break;
      case "1":
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registro exitoso!.\nSe enviará un correo en los próximos minutos."),
          ),
        );
        Timer(Duration(seconds: 1),
                () => Navigator.of(context).pushReplacementNamed('/login'));
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 10),
            content: Text("Ocurrió algo inesperado\n Motivo: Error del Servidor"),
          ),
        );
        break;
    }



  }
}
