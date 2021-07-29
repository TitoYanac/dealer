import 'package:dealer/Views/Empresa/Envios/Components/popup.dart';
import 'package:dealer/Views/Empresa/Envios/Components/popup_body.dart';
import 'package:dealer/Views/Empresa/Envios/Components/popup_content.dart';
import 'package:dealer/constats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Envios extends StatefulWidget {
  @override
  _EnviosState createState() => _EnviosState();
}

class _EnviosState extends State<Envios> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: [
          SizedBox(height: 40,),
          Center(child: Text("Elige el tipo de Servicio",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),

          SizedBox(height: 10,),
          Center(child: Text("Que más te conviene",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),
          SizedBox(height: 20,),
          for(var item in tiposDeEnvio)
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1.0,color: kSecondaryColor,),
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
                leading: Image.asset("${item['icon']}", width: 60.0,),
                title: Text("${item['tipo']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                subtitle: Column(
                  children: [
                    Container(margin: EdgeInsets.symmetric(vertical: 6),child: Text("${item['text']}",style: TextStyle(fontSize: 14),)),
                    Text("${item['tiempo']}",),
                  ],
                ),
                dense: false,
                onTap: (){
                  showPopup(context, PopUpBody(tipo:"${item['tipo']}"),"CREA UN ENVIO EXPRESS");
                },
              ),
            ),
        ],
      ),
    );

  }


showPopup(BuildContext context, Widget widget, String tipo,
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
            title: Text(tipo,textAlign: TextAlign.end,style: TextStyle(color: Colors.white),),
            leading: new Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.close,color: Colors.white,),
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
