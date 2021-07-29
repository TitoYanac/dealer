class empresa_ficha_en_reparto {
  String fecha_creacion_ficha;
  String fecha_aceptacion_envio;
  String fecha_finalizacion_envio;
  String estado;
  //datos del comprador
  String nombre_comprador;
  String apellido_comprador;
  String documento_comprador;
  String celular_comprador;
  //lugar de entrega
  String direccion;
  String distrito;
  //datos del producto
  String producto;
  String descripcion;
  String SizeProduct;
  String delicado;
  //datos del conductor
  String nombre_conductor;
  String apellido_conductor;
  //datos del vehiculo
  String placa;
  String color;
  //datos de la ficha
  String tipoenvio;
  String idempresa;
  String monto;
  empresa_ficha_en_reparto(
      this.fecha_creacion_ficha,
      this.fecha_aceptacion_envio,
      this.fecha_finalizacion_envio,
      this.estado,
      this.nombre_comprador,
      this.apellido_comprador,
      this.documento_comprador,
      this.celular_comprador,
      this.direccion,
      this.distrito,
      this.producto,
      this.descripcion,
      this.SizeProduct,
      this.delicado,
      this.nombre_conductor,
      this.apellido_conductor,
      this.placa,
      this.color,
      this.tipoenvio,
      this.idempresa,
      this.monto,
      );
  empresa_ficha_en_reparto.fromJson(Map<String, dynamic> json) {
    fecha_creacion_ficha = json['fecha_creacion_ficha'];
    fecha_aceptacion_envio = json['fecha_aceptacion_envio'];
    fecha_finalizacion_envio = json['fecha_finalizacion_envio'];
    estado = json['estado'];
    nombre_comprador = json['nombre_comprador'];
    apellido_comprador = json['apellido_comprador'];
    documento_comprador = json['documento_comprador'];
    celular_comprador = json['celular_comprador'];
    direccion = json['direccion'];
    distrito = json['distrito'];
    producto = json['producto'];
    descripcion = json['descripcion'];
    SizeProduct = json['SizeProduct'];
    delicado = json['delicado'];
    nombre_conductor = json['nombre_conductor'];
    apellido_conductor = json['apellido_conductor'];
    placa = json['placa'];
    color = json['color'];
    tipoenvio = json['tipoenvio'];
    idempresa = json['idempresa'];
    monto = json['monto'];
  }
}
