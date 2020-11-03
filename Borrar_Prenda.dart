import 'package:dumas/Front/Menu.dart';
import 'package:dumas/Modelo/prenda_model.dart';
import 'package:dumas/widgets/BarritaConTexto.dart';
import 'package:dumas/widgets/DumasLogo.dart';
import 'package:dumas/widgets/GridViewDeletePrendas.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeleteTable extends StatefulWidget {
  List<Prenda> listaprendas;

  // ignore: invalid_required_positional_param
  DeleteTable({Key key, @required this.listaprendas}) : super(key: key);
  @override
  _DeleteTableState createState() => _DeleteTableState();
}

class _DeleteTableState extends State<DeleteTable> {
  //int i = widget.listaprendas.length;

  @override
  Widget build(BuildContext context) {
    // int position = widget.listaprendas.length;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ("Borrar Prenda"),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(239, 180, 185, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Logo.size(
                letraSize: 80,
              ), 
              BarraDePantalla(mensaje: "Borrar Prenda"),
              Text(
                "Elige una prenda a borrar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  wordSpacing: 3,
                ),
              ),
              Elije_Prenda_a_borrar(
                listaprendas: widget.listaprendas,
              ),
              //Text("data"),
              Botones(textoboton: "Cancelar"),
            ],
          ),
        ),
        /*  FlatButton(
                onPressed: () {
                  print(position);
                },
                child: Text("Valor de position")),
            Text("BOCA LA CONCHA DE TU MADRE"),
            */
      ),
    );
  }
}
