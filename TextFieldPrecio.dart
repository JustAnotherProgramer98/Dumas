import 'package:flutter/material.dart';

class TextFieldPrecio extends StatelessWidget {
  const TextFieldPrecio({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: TextField(
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Precio ingresado"),
                actions: [
                  Text("Ingresaste " + value + " como precio , continuar?"),
                  FlatButton(
                    onPressed: () {},
                    child: Text("Aceptar"),
                  )
                ],
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.grey[100],
                title: Text(
                  "Error ",
                  style: TextStyle(
                    wordSpacing: 1.2,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("No ingresaste ningun valor "),
                    Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Volver"),
                  )
                ],
              ),
            );
          }
        },
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        decoration: InputDecoration(
          filled: false,
          //fillColor: Color.fromRGBO(250, 207, 244, 10),
          labelText: "Ingresa un precio",
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
