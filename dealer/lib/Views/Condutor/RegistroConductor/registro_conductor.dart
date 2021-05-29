import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dealer/constats.dart';
import 'package:flutter/material.dart';

class RegistroConductor extends StatelessWidget {
  final String data;
  const RegistroConductor({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          data,
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
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nombre_conductor = new TextEditingController();
  final TextEditingController apellido_conductor = new TextEditingController();
  final TextEditingController correo_conductor = new TextEditingController();
  final TextEditingController pass1_conductor = new TextEditingController();
  final TextEditingController pass2_conductor = new TextEditingController();

  bool _checked;
  @override
  void initState() {
    _checked = false;
    super.initState();
  }@override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Container(
            height: 200,
            margin: EdgeInsets.all(50.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      "assets/icons/icon_moto.jpg",
                    ))),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: kPrimaryColor))),
            child: TextFormField(
              controller: nombre_conductor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "NOMBRE",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese su nombre';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: kPrimaryColor))),
            child: TextFormField(
              controller: apellido_conductor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "APELLIDO",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese sus apellidos';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: kPrimaryColor))),
            child: TextFormField(
              controller: correo_conductor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "CORREO",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese su correo electronico';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: kPrimaryColor))),
            child: TextFormField(
              controller: pass1_conductor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "CONTRASEÑA",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese su contraseña';
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: kPrimaryColor))),
            child: TextFormField(
              controller: pass2_conductor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "CONFIRMAR CONTRASEÑA",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Las contraseñas no coinciden';
                }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: CheckboxListTile(
              title: Text(
                "Acepto los Términos y Condiciones de Delaer para el tratamiento de mis datos.",
              ),
              secondary: Icon(Icons.beach_access,color: _checked?kPrimaryColor:Colors.grey,),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checked,
              onChanged: (bool value){
                setState(() {
                  _checked = value;
                });
              },
              activeColor: kPrimaryColor,
              checkColor: Colors.white,
              dense: true,

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
                if (_formKey.currentState.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Registrando Conductor'),
                  ));
                  RegistrarConductor(nombre_conductor,  apellido_conductor,  correo_conductor,  pass1_conductor,  pass2_conductor);

                Timer(Duration(seconds: 3),
                    () => Navigator.of(context).pushReplacementNamed('/login'));
              }
                },
              child: Text('REGISTRAR CONDUCTOR'),
            ),
          ),
        ],
      ),
    );
  }
  Future RegistrarConductor(TextEditingController nombre_conductor, TextEditingController apellido_conductor, TextEditingController correo_conductor, TextEditingController pass1_conductor, TextEditingController pass2_conductor) async {


    var url = Uri.parse(
        'https://dealertesting.000webhostapp.com/registrar_conductor.php');
    await http.post(url, body: {'nombre': nombre_conductor.text, 'apellido': apellido_conductor.text, 'correo': correo_conductor.text, 'pass1': pass1_conductor.text});

  }
}
