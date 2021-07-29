class empresa_ficha_pendiente {
  String id_ficha;
  String id_empresa;
  String nombre_empresa;
  String fecha_creacion_ficha;
  String estado;
  String nombre_comprador;
  String apellido_comprador;
  String documento_comprador;
  String celular_comprador;
  String direccion_comprador;
  String distrito_comprador;
  String producto;
  String descripcion;
  String SizeProduct;
  String delicado;
  String tipoenvio;
  String monto;

  empresa_ficha_pendiente(
      this.id_ficha,
      this.id_empresa,
      this.nombre_empresa,
      this.fecha_creacion_ficha,
      this.estado,
      this.nombre_comprador,
      this.apellido_comprador,
      this.documento_comprador,
      this.celular_comprador,
      this.direccion_comprador,
      this.distrito_comprador,
      this.producto,
      this.descripcion,
      this.SizeProduct,
      this.delicado,
      this.tipoenvio,
      this.monto
      );
  empresa_ficha_pendiente.fromJson(Map<String, dynamic> json) {
    this.id_ficha = json['id_ficha'];
    this.id_empresa = json['id_empresa'];
    this.nombre_empresa = json['nombre_empresa'];
    this.fecha_creacion_ficha = json['fecha_creacion_ficha'];
    this.estado  = json['estado'];
    this.nombre_comprador = json['nombre_comprador'];
    this.apellido_comprador = json['apellido_comprador'];
    this.documento_comprador = json['documento_comprador'];
    this.celular_comprador = json['celular_comprador'];
    this.direccion_comprador = json['direccion_comprador'];
    this.distrito_comprador = json['distrito_comprador'];
    this.producto = json['producto'];
    this.descripcion = json['descripcion'];
    this.SizeProduct = json['SizeProduct'];
    this.delicado = json['delicado'];
    this.tipoenvio = json['tipoenvio'];
    this.monto = json['monto'];
  }
}
