import 'package:dumas/Modelo/prenda_model.dart';
import 'package:dumas/widgets/BarraNavegacionInferior.dart';
import 'package:dumas/widgets/DumasLogo.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

// ignore: must_be_immutable
class OnTapTable extends StatefulWidget {
  // ignore: non_constant_identifier_names

  List<Prenda> listaprendas;

  // ignore: non_constant_identifier_names
  OnTapTable({Key key, this.listaprendas}) : super(key: key);

  @override
  _OnTapTableState createState() => _OnTapTableState();
}
 
// ignore: camel_case_types
class _OnTapTableState extends State<OnTapTable> {
  updateParent(String text) {
    if (text == "Compartir") {
      enviarImagen(context);
    }
  }

  void enviarImagen(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(widget.listaprendas[i].url_imagen,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    var personalizado = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar:
            BarraNavegacionInferior(cambiarpadre: updateParent),
        backgroundColor: Color.fromRGBO(239, 180, 185, 1),
        body: SafeArea(
          child: GestureDetector(
            onDoubleTap: () {
              if (i != (widget.listaprendas.length) - 1) {
                print(i);
                setState(() {
                  i++;
                });
              }
            },
            onHorizontalDragStart: (details) {
              /*if (widget.listaprendas[i].cantidad == 0) {
          Poner en rojo la cantidad      var cantidad_peligrosa =
                    TextStyle(color: Colors.red, fontSize: 12);
              */
              if (i != 0) {
                print(i);
                setState(() {
                  i--;
                });
              }
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Logo(),
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 348,
                      height: 348,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            widget.listaprendas[i].url_imagen,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(75),
                        shape: BoxShape.rectangle,
                        //),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            "fecha de publicacion" +
                                "  " +
                                widget.listaprendas[i].fecha_carga,
                            style: personalizado.apply(fontSizeFactor: 1.2)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "precio: " +
                              "" +
                              widget.listaprendas[i].precio.toString(),
                          style: personalizado,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "cantidad:" +
                              " " +
                              widget.listaprendas[i].cantidad.toString(),
                          style: personalizado,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
