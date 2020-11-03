import 'package:dumas/Modelo/prenda_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Elije_Prenda_a_borrar extends StatelessWidget {
  final List<Prenda> listaprendas;
  //final List<Color> colores_gradiente;

  const Elije_Prenda_a_borrar({
    this.listaprendas,
    //this.colores_gradiente,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(250, 207, 244, 1),
            Color.fromRGBO(239, 180, 185, 1),
          ],
          tileMode: TileMode.repeated,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        //gradient: Gradient.linear(from, to, colors),
        //border: Border.all(color: Colors.white, width: 1.2),
        //borderRadius: BorderRadius.circular(5),
      ),
      height: MediaQuery.of(context).size.height / 1.5,
      width: (MediaQuery.of(context).size.width),
      child: GridView.builder(
        itemCount: listaprendas.length,
        scrollDirection: Axis.vertical,
        semanticChildCount: listaprendas.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, position) => Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(listaprendas[position].url_imagen),
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
