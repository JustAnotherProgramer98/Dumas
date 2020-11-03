import 'package:flutter/material.dart';

class BarraDePantalla extends StatelessWidget {
  const BarraDePantalla({
    Key key,
    this.altopantalla,
    @required this.mensaje,
  }) : super(key: key);

  final double altopantalla;
  final String mensaje;
  //SUCIO CULIAO
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 15),
      width: altopantalla,
      height: 15,
      color: Color.fromRGBO(250, 207, 244, 10),
      child: Center(
        child: Text(
          mensaje,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            //backgroundColor: Color.fromRGBO(250, 207, 244, 10),
          ),
        ),
      ),
    );
  }
}
