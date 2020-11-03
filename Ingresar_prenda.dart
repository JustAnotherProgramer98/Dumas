import 'package:dumas/widgets/BarritaConTexto.dart';
import 'package:dumas/widgets/ComboBoxPrenda.dart';
import 'package:dumas/widgets/DumasLogo.dart';
import 'package:dumas/widgets/PopupMenuColores.dart';
import 'package:dumas/widgets/SliderPersonal.dart';
import 'package:dumas/widgets/SwitchConLabel.dart';
import 'package:dumas/widgets/TextFieldPrecio.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Ingresarprenda extends StatefulWidget {
  // ignore: non_constant_identifier_names
  var estilo_personalizado = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  Ingresarprenda({Key key}) : super(key: key);
  @override
  _Ingresar_prendaState createState() => _Ingresar_prendaState();
}

// ignore: camel_case_types
class _Ingresar_prendaState extends State<Ingresarprenda> {
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;

    //double valorheight = MediaQuery.of(context).size.height;
    //double valorwidght = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ingresar Prenda",
      home: Scaffold(
        backgroundColor: Color.fromRGBO(239, 180, 185, 1),
        body: SingleChildScrollView(
          child: Container(
            //height: 700,
            margin: EdgeInsets.only(bottom: 10, right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Logo(),
                BarraDePantalla(mensaje: "ingresar prenda"),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  height: alto / 1.50,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      //boxShadow: BoxShadow()  sombras no , bordes
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 2),
                        left: BorderSide(color: Colors.white, width: 2),
                        right: BorderSide(color: Colors.white, width: 2),
                        top: BorderSide(color: Colors.white, width: 2),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Que preda es?",
                            style: widget.estilo_personalizado,
                          ),
                          SwitchConNombre(
                            numero_de_opcion: 1,
                            texto: "Crear categoria",
                          ),
                          Text("Que cantidad es?",
                              style: widget.estilo_personalizado),
                          SwitchConNombre(texto: "Ingresar manual"),
                          Text(
                            "Que color es",
                            style: widget.estilo_personalizado,
                          ), 
                          SwitchConNombre(texto: "Nuevo color"),
                          SizedBox(height: 30),
                          Text("Precio", style: widget.estilo_personalizado),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      //Aca termina la primera columna , y deberias poner la segunda columna
                      Column(
                        children: <Widget>[
                          ComboboxPrenda(
                              estilo_personalizado:
                                  widget.estilo_personalizado),
                          SizedBox(
                            height: 14,
                          ),
                          SliderPersonal(),
                          SizedBox(
                            height: 25,
                          ),
                          //PopupMenuButtonColores(),
                          PopupMenuButtonColores(
                            color: Colors.black26,
                            i: 0,
                            icono: Icons.favorite,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextFieldPrecio()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
