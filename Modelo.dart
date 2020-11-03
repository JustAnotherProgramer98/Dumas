import 'package:flutter/material.dart';

class Prenda {
  String tipo;
  // ignore: non_constant_identifier_names
  String url_imagen, fecha_carga;
  int cantidad;
  int precio;

  Prenda(
    // ignore: invalid_required_positional_param
    @required this.tipo,
    // ignore: invalid_required_positional_param
    @required this.url_imagen,
    // ignore: invalid_required_positional_param
    @required this.fecha_carga,
    // ignore: invalid_required_positional_param
    @required this.cantidad,
    // ignore: invalid_required_positional_param
    @required this.precio,
  );
}
