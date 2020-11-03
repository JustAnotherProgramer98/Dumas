import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ValorEnviado extends StatefulWidget {
  String texto;

  ValorEnviado({
    Key key,
    @required this.texto,
  }) : super(key: key);

  @override
  _ValorEnviadoState createState() => _ValorEnviadoState();
}

// ignore: unused_element
class _ValorEnviadoState extends State<ValorEnviado> {
  @override
  Widget build(BuildContext context) {
    String resultado;
    Color grisclaro = Color.fromRGBO(214, 210, 196, 1);
    Color rosatenue = Color.fromRGBO(247, 218, 217, 1);

    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 180, 185, 1),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning,
                  size: 40,
                  color: Colors.redAccent,
                ),
                Text(
                  "ATENCION",
                  style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 50, width: 50),
                Text(
                  "Crearas la categoria: " + widget.texto,
                  style: TextStyle(
                    wordSpacing: 5,
                    fontSize: 15.4,
                    //color: Color.fromRGBO(175, 45, 45, 10),
                    color: rosatenue,
                  ),
                ),
                SizedBox(height: 100, width: 100),
                FlatButton(
                    onPressed: () {
                      resultado = widget.texto;
                      Navigator.of(context).pop(resultado);
                    },
                    child: Text(
                      "Aceptar",
                      style: TextStyle(
                        color: Colors.lightBlue[300],
                        fontSize: 15,
                      ),
                    )),
                FlatButton(
                  onPressed: () {
                    resultado = "Cancelar";
                    Navigator.of(context).pop(resultado);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(
                      color: grisclaro,
                      fontSize: 15,
                    ),
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
