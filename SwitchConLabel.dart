import 'dart:ui';

import 'package:dumas/widgets/ConfrimarPrenda.dart';
import 'package:flutter/material.dart';

class SwitchConNombre extends StatefulWidget {
  final String texto;
  // ignore: non_constant_identifier_names
  final int numero_de_opcion;
  const SwitchConNombre({
    Key key,
    // ignore: non_constant_identifier_names
    this.numero_de_opcion,
    @required this.texto,
  }) : super(key: key);

  @override
  _SwitchConNombreState createState() => _SwitchConNombreState();
}

class _SwitchConNombreState extends State<SwitchConNombre> {
  bool valorBoton;

  @override
  void initState() {
    valorBoton = false;

    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

/*
  crearcategoria() {
    String prenda;
    showDialog(
        context: null,
        child: Dialog(
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ingresa una categoria",
                icon: Icon(
                  Icons.new_releases,
                  color: Colors.yellowAccent[100],
                )),
            onSubmitted: (String control) {
              prenda = control;
            },
          ),
        ));
    return prenda;
  }
*/
  void cambioDeValor(bool cambio, int opcion) {
    //String retorno;
    setState(() {
      valorBoton = cambio;
      if (opcion == 1 && valorBoton) {
        //Crear prenda
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Dialog(
                  child: Container(
                    height: 100,
                    width: 250,
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.new_releases),
                          labelText: "Ingresa una categoria",
                        ),
                        //return valoractual,
                        onSubmitted: (value) {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => ValorEnviado(texto: value),
                            ),
                          )
                              .then((result) {
                            if (result != null && result != "") {
                              setState(() {
                                value = result;
                                print("Acepto la creacion de categoria***");
                                print(value + "Esta categoria fue creada");
                              });
                              Navigator.of(context).pop();

                              return value;
                            } else {
                              cambio = false;
                              print("no ingresaste nada");
                            }
                          });
                          //return valoractual,
                          //Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Switch(
            value: valorBoton,
            onChanged: (bool cambio) {
              cambioDeValor(cambio, widget.numero_de_opcion);
            },
            activeColor: Colors.white),
        Text(
          widget.texto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
