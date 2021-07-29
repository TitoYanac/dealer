import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(246, 164, 36, 1);
const kSecondaryColor = Color.fromRGBO(173, 172, 172, 1);
const kThirdColor = Color.fromRGBO(229, 226, 225, 1);

const String img1 = "assets/images/banner_login.png";
const String img2 = "assets/images/logo_normal.png";


List<Map> tiposDeEnvio = [
  {
    'tipo' : 'EXPRESS',
    'icon' : 'assets/icons/icon_moto.png',
    'text' : 'Realiza tus envíos el mismo día en horario 1pm a 5pm. Solo a nivel de Lima y Callao',
    'tiempo' : 'Tiempo estimado: 3 horas'
  },
  {
    'tipo' : 'SAME DAY',
    'icon' : 'assets/icons/icon_tipo2.png',
    'text' : 'Registra un envío hasta el medio día de hoy y será entregado en horarios de la tarde. Solo a nivel de Lima y Callao',
    'tiempo' : 'Hora de entrega entre: 1pm - 8pm'
  },
  {
    'tipo' : 'NEXT DAY',
    'icon' : 'assets/icons/icon_tipo3.png',
    'text' : 'Registra un envío para mañana y será enviado en el horario de 8am a 1pm. Solo a nivel de Lima y Callao',
    'tiempo' : 'Registra antes de las 23:59 pm'
  },
];
List<String> miDistrito = [
  'RIMAC',
  'BREÑA',
  'LIMA',
  'SAN MIGUEL',
  'PUEBLO LIBRE',
  'JESÚS MARIA',
  'MAGDALENA DEL MAR',
  'LINCE',
  'LA VICTORIA',
  'SAN BORJA',
  'SAN ISIDRO',
  'SURQUILLO',
  'MIRAFLORES',
  'SANTIAGO DE SURCO',
  'BARRANCO',
  'SAN LUIS',
  'SAN JUAN DE LURIGANCHO',
  'EL AGUSTINO',
  'SANTA ANITA',
  'ATE',
  'LA MOLINA',
  'SAN MARTIN DE PORRES',
  'CHORRILLO',
  'VILLA MARIA DEL TRIUNFO',
  'VILLA EL SALVADOR'
];

