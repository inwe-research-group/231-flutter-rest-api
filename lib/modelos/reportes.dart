class Reportes {
  int reporte_id;
  String reporte_name;
  String reporte_name_qry;
  String reporte_descripcion;
  String reporte_qry;

  Reportes({
    required this.reporte_id,
    required this.reporte_name,
    required this.reporte_name_qry,
    required this.reporte_descripcion,
    required this.reporte_qry,
  });

  factory Reportes.fromJson(Map<String, dynamic> json) {
    return Reportes(
      reporte_id: json["reporte_id"],
      reporte_name: json["reporte_name"],
      reporte_name_qry: json["reporte_name_qry"],
      reporte_descripcion: json["reporte_descripcion"],
      reporte_qry: json["reporte_qry"],
    );
  }
}
