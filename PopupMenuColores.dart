import 'package:flutter/material.dart';

final lista = [
  "blanco",
  "negro ",
  "azul",
  "rojo",
  "amarillo",
  "celeste",
  "verde",
  "rosa",
  "girs",
  "naranja",
  "violeta",
];

List<Color> colors = [
  Colors.white,
  Colors.black,
  Colors.blue[900],
  Colors.red,
  Colors.yellow,
  Colors.lightBlue,
  Colors.green,
  Colors.pink[200],
  Colors.grey,
  Colors.orange,
  Colors.purple[600],
];

/*
>	mayor que	5 > 2
<
*/
enum MenuOption {
  blanco, //0
  negro, //1
  azul, //2
  rojo, //3
  amarrillo, //4
  celeste, //5
  verde, //6
  rosa, //7
  gris, //8
  naranja, //9
  violeta //10
}

class PopupMenuButtonColores extends StatefulWidget {
  @required
  final Color color;
// ignore: non_constant_identifier_names

  @required
  final IconData icono;
  @required
  final int i;

  // ignore: non_constant_identifier_names
  const PopupMenuButtonColores({Key key, this.color, this.icono, this.i})
      : super(key: key);

  @override
  _PopupMenuButtonColoresState createState() => _PopupMenuButtonColoresState();
}

class _PopupMenuButtonColoresState extends State<PopupMenuButtonColores> {
  // ignore: non_constant_identifier_names
  String valor_a_devolver = "";
  // ignore: non_constant_identifier_names
  Icon icono_elegido =
      Icon(Icons.favorite_border_sharp, color: Colors.red[900]);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            height: 100,
            child: Container(
              width: 400,
              height: 100,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                semanticChildCount: lista.length,
                itemCount: lista.length,
                //physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, i) => Container(
                  child: IconButton(
                    icon: Icon(
                      (i == 0) ? Icons.favorite_border : widget.icono,
                      color: (i == 0) ? Colors.black26 : colors.elementAt(i),
                    ),
                    onPressed: () {
                      setState(() {
                        icono_elegido = Icon(
                          widget.icono,
                          color: colors.elementAt(i),
                        );
                        valor_a_devolver = colors.elementAt(i).toString();
                      });

                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Seleccionado"),
                          content: Text(
                              "El color seleccionado es ${lista.elementAt(i)}"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  setState(() {
                                    colors.add(colors.elementAt(i));
                                  });

                                  //print("Te fuiste a la B por puto y cagon");
                                  Navigator.of(context).pop("Aceptar");
                                  //Navigator.of(context).pop();
                                },
                                child: Text("Aceptar")),
                            FlatButton(
                                onPressed: () {
                                  //print(valor_a_devolver);
                                  print(colors);
                                  Navigator.of(context).pop("Cancelar");
                                },
                                child: Text("cancelar")),
                          ],
                        ),
                      );
                    },
                  ),
                ), //on pressed
              ),
            ),
            value: MenuOption.values[widget.i],
          ),
        ];
      },
      icon: icono_elegido,
    );
  }
}
