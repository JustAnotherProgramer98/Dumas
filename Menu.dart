import 'package:flutter/material.dart';
import 'Mostrar_prods.dart';
import 'On_tap_table.dart';
import 'Ingresar_prenda.dart';

void main() {
  runApp(
    MaterialApp(
// Comillas simples ' '
//Barra invertida  \\
      routes: {
        '/home': (context) => Fondo(),
        '/chequeo': (context) => Products(),
        '/ontap': (context) => OnTapTable(),
        '/agregar_ropa': (context) => Ingresarprenda(),
      },
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.amber,
          body: Fondo(),
        ),
      ),
    ),
  );
}

class Fondo extends StatelessWidget {
  const Fondo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double valorheight = MediaQuery.of(context).size.height;
    double valorwidght = MediaQuery.of(context).size.width;

    return Container(
      height:
          valorheight, //MediaQuery.of(context).size.height,  para que tome todo el alto de la pantalla
      width:
          valorwidght, //MediaQuery.of(context).size.width,   para que tome todo el largo de la pantalla
      //<>
      decoration: BoxDecoration(
        color: Color.fromRGBO(239, 180, 185, 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,

        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 270, top: 80),
            child: CustomPaint(
              painter: Mi_rectangulo(),
              child: Material(
                color: Colors.transparent,
                child: Text(
                  "DUMAS",
                  style: TextStyle(
                    color: //Color.fromRGBO(250, 207, 244, 100),
                        Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Botones(
            textoboton: "Ingresar prenda",
            nombreruta: '/agregar_ropa',
          ),
          Botones(
            textoboton: "Chequear existencias",
            nombreruta: "/chequeo",
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Botones extends StatefulWidget {
  final String textoboton;
  final Color colorletra = Colors.white;
  String nombreruta;

  Botones({Key key, @required this.textoboton, this.nombreruta})
      : super(key: key);

  //HomeMemberStateful({Key key, @required this.user}) : super(key: key);
  @override
  _BotonesState createState() => _BotonesState();
}

class _BotonesState extends State<Botones> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 30,
      width: 200,
      //padding: EdgeInsets.all(10),
      //margin: EdgeInsets.all(10),
      child: RaisedButton(
        //padding: EdgeInsets.only(bottom: 20),
        onPressed: () {
          Navigator.of(context).pushNamed(widget.nombreruta);
        },
        shape: StadiumBorder(
          side: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
        color: Color.fromRGBO(239, 180, 185, 1),
        child: Center(
          child: Text(
            widget.textoboton,
            style: TextStyle(color: widget.colorletra),
          ),
        ),
      ),
    );
  } 
}

//LA CLASE PAINT , LA USE PARA HACER EL RACTANGULO
// ignore: camel_case_types
class Mi_rectangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    //a rectangle
    canvas.drawRect(Offset(-40, 0) & Size(335, 523), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
