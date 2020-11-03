// ignore: unused_import
import 'package:dumas/Front/Borrar_Prenda.dart';
import 'package:dumas/Front/On_tap_table.dart';
import 'package:dumas/Modelo/prenda_model.dart';
import 'package:dumas/widgets/DumasLogo.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  //List <String> prod;
  Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool valoractual;
  List<Prenda> prod;

  @override
  void initState() {
    super.initState();
    valoractual = false;
  }

  @override
  Widget build(BuildContext context) {
    //Hago que el stream este disponible en la clase

    void cambioDeValor(bool cambio) {
      setState(() { 
        valoractual = cambio;
      });
    }

    prod = [
      Prenda(
        "Vestido",
        "https://instagram.ftuc2-1.fna.fbcdn.net/v/t51.2885-15/e35/120848338_781685702402445_9044350276150331304_n.jpg?_nc_ht=instagram.ftuc2-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=s1sHplF45ucAX8H7054&_nc_tp=18&oh=87fecde6a6e66039f2767aded1df2bdb&oe=5FBE360D",
        "10/04/2020",
        13,
        750,
      ),
      Prenda(
        "Buzos",
        "https://instagram.ftuc2-1.fna.fbcdn.net/v/t51.2885-15/e35/122137484_1361411327535209_2998499129849100781_n.jpg?_nc_ht=instagram.ftuc2-1.fna.fbcdn.net&_nc_cat=105&_nc_ohc=ix690xETxOAAX9cPyoW&_nc_tp=18&oh=3b2c7be0b69bfae8c2bed7749871aa40&oe=5FBED5B1",
        "22/07/2019",
        5,
        1500,
      ),
      Prenda(
        "Polleras",
        "https://instagram.ftuc2-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s750x750/121147784_360974504949082_4027396562392973349_n.jpg?_nc_ht=instagram.ftuc2-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=9QqfRzbvQxUAX9XoowV&_nc_tp=24&oh=58f1d76eb5f94d43e43615935b062d8c&oe=5FBFDFC9",
        "14/09/2020",
        22,
        3700,
      ),
      Prenda(
        "Monitos",
        "https://instagram.ftuc2-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s750x750/120721587_3291269917588750_8754823409109770102_n.jpg?_nc_ht=instagram.ftuc2-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=XCRwqH5iDtMAX8_9NCY&_nc_tp=24&oh=2feeab63b0f2e1a26cac26f615a90612&oe=5FBF1469",
        "18/08/2020",
        0,
        25000,
      ),
      Prenda(
          "Jeans",
          "https://cdn.pixabay.com/photo/2020/05/15/13/28/reading-5173530_960_720.jpg",
          "16/09/2014",
          43,
          50),
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(239, 180, 185, 1),
          title: Logo.size(
            letraSize: 40,
          ),
          actions: <Widget>[
            Icon(
              Icons.search,
              size: 25,
            ),
            Switch(
              activeColor: Colors.white,
              inactiveThumbColor: Colors.blue[900],
              value: valoractual,
              onChanged: (bool cambio) {
                cambioDeValor(cambio);
                //cambiovalor();
                if (valoractual) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      content: Text("Elige una categoria para borrarla"),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Aceptar"),
                        )
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content:
                          Text("Elige una categoria para desplegar las vistas"),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Aceptar"),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
            Icon(Icons.delete, size: 20),
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: (prod != null)
              ? ListView.builder(
                  itemCount: prod.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(prod[index].tipo),
                      trailing: Text(prod[index].precio.toString()),
                      leading: Image.network(
                        prod[index].url_imagen,
                        fit: BoxFit.fill,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => (valoractual)
                                ? DeleteTable(
                                    listaprendas: prod,
                                  )
                                : OnTapTable(listaprendas: prod),
                          ),
                        );
                      },
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )),
        ));
  }
}
