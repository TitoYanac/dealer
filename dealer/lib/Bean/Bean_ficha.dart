class ficha {
  String nombre;
  String apellido;
  String documento;
  String celular;
  String direccion;
  String id_distrito;
  String producto;
  String delicado;
  String descripcion;
  String idtipoenvio;
  String idempresa;
  String estado;
  ficha(
    this.nombre,
    this.apellido,
    this.documento,
    this.celular,
    this.direccion,
    this.id_distrito,
    this.producto,
    this.delicado,
    this.descripcion,
    this.idtipoenvio,
    this.idempresa,
    this.estado,
  );
  ficha.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    apellido = json['apellido'];
    documento = json['documento'];
    celular = json['celular'];
    direccion = json['direccion'];
    id_distrito = json['id_distrito'];
    producto = json['producto'];
    delicado = json['delicado'];
    descripcion = json['descripcion'];
    idtipoenvio = json['idtipoenvio'];
    idempresa = json['idempresa'];
    estado = json['estado'];
  }
}
