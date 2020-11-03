import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'GridViewImagen_aumentada.dart';

class Galeria extends StatefulWidget {
  Galeria({Key key}) : super(key: key);

  @override
  _GaleriaState createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {
  bool cargando;
  List<String> id;

  @override
  void initState() {
    cargando = true;
    id = [];

    _cargarImagenId();
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  void _cargarImagenId() async {
    final response = await http.get("https://picsum.photos/v2/list");
    final json = jsonDecode(response.body);
    List<String> _id = [];
    for (var image in json) {
      _id.add(image["id"]);
    }
    setState(() {
      cargando = false;
      id = _id;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cargando) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.purple,
        ),
      );
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ImagenGrande(id[index]),
              ),
            );
          },
          child: Image.network(
            "https://picsum.photos/id/${id[index]}/300/300",
          ),
        );
      },
      itemCount: id.length,
    );
  }
}
