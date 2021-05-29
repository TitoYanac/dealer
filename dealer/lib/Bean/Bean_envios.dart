class envios {
  String ID_Ficha;
  String Nombre_Comercial;
  String ORIGEN;
  String DESTINO;
  String TIPO;
  String ESTADO;

/*
  String CLIENTE;
  String PRODUCTO;
  String FACTURA_BOLETA;

*/
  envios(
    this.ID_Ficha,
    this.Nombre_Comercial,
    this.ORIGEN,
    this.DESTINO,
    this.TIPO,
    this.ESTADO,

    /*
      this.CLIENTE,
      this.PRODUCTO,
      */
  );
  envios.fromJson(Map<String, dynamic> json) {
    ID_Ficha = json['ID_Ficha'];
    Nombre_Comercial = json['Nombre_Comercial'];
    ORIGEN = json['ORIGEN'];
    DESTINO = json['DESTINO'];
    TIPO = json['Tipo'];
    ESTADO = json['ESTADO'];
    /*
    CLIENTE = json['CLIENTE'];
    PRODUCTO = json['PRODUCTO'];
    */
  }
}
