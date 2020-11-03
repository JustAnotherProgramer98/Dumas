import 'dart:ui';
import 'package:flutter/material.dart';

class BarraNavegacionInferior extends StatefulWidget {
  final ValueChanged<String> cambiarpadre;

  const BarraNavegacionInferior({
    Key key,
    this.cambiarpadre,
  }) : super(key: key);

  @override
  _BarraNavegacionInferiorState createState() =>
      _BarraNavegacionInferiorState();
}

class _BarraNavegacionInferiorState extends State<BarraNavegacionInferior> {
  int _currentIndex = 0;
  String urlfoto;

  @override
  void initState() {
    urlfoto = "";
    super.initState();
  }

  void apretaricono(int index) {
    if (index == 0) {
    } else if (index == 1) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          //backgroundColor: Colors.transparent,
          //title: Text("Pantalla de ayuda"),
          content: Text(
              "Aprieta rapidamente 2 veces la imagen \npara ver la siguente imagen perteneciente a su categoria\n"
              "Desplaza hacia la izquierda para retroceder en las imagenes",
              style: TextStyle(color: Colors.grey)),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  //print(valor_a_devolver);
                  //print(colors);
                  Navigator.of(context).pop("Aceptar");
                },
                child: Text("Aceptar",
                    style: TextStyle(color: Color.fromRGBO(239, 180, 185, 1)))),
          ],
        ),
      );
    } else if (index == 2) {
      widget.cambiarpadre("Compartir");
    }

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.white,

      // selectedItemColor: ,
      iconSize: 22,
      selectedItemColor: Color.fromRGBO(250, 207, 244, 10),
      currentIndex: _currentIndex,

      //backgroundColor: widget.color,
      items: [
        BottomNavigationBarItem(
            label: ("Editar"),
            backgroundColor: Colors.blue[900],
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            )),
        BottomNavigationBarItem(
            label: ("Ayuda"),
            backgroundColor: Colors.blue,
            icon: Icon(Icons.help_outline_sharp, color: Colors.white)),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.share,
            color: Colors.white,
          ),
          label: ("Compartir"),
          backgroundColor: Color.fromRGBO(33, 66, 82, 10),
        ),
      ],
      type: BottomNavigationBarType.shifting,
      onTap: apretaricono,
    );
  }
}
