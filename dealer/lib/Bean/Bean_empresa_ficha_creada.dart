class empresa_ficha_creada {
  String nombre;
  String apellido;
  String documento;
  String celular;
  String direccion;
  String distrito;
  String producto;
  String descripcion;
  String SizeProduct;
  String delicado;
  String tipoenvio;
  String idempresa;

  empresa_ficha_creada(
    this.nombre,
    this.apellido,
    this.documento,
    this.celular,
    this.direccion,
    this.distrito,
    this.producto,
    this.descripcion,
    this.SizeProduct,
    this.delicado,
    this.tipoenvio,
    this.idempresa
  );
  empresa_ficha_creada.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    apellido = json['apellido'];
    documento = json['documento'];
    celular = json['celular'];
    direccion = json['direccion'];
    distrito = json['distrito'];
    producto = json['producto'];
    delicado = json['delicado'];
    delicado = json['size'];
    descripcion = json['descripcion'];
    tipoenvio = json['tipoenvio'];
    idempresa = json['idempresa'];
  }
}
