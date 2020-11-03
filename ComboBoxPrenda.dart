import 'package:flutter/material.dart';

//clase original
class ComboboxPrenda extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final TextStyle estilo_personalizado;

  const ComboboxPrenda({
    Key key,
    // ignore: non_constant_identifier_names
    this.estilo_personalizado,
  }) : super(key: key);
  @override
  _ComboboxPrendaState createState() => _ComboboxPrendaState();
}

//ESTADO
class _ComboboxPrendaState extends State<ComboboxPrenda> {
  List prendas = ["Vestido", "Jeans", "Remeras", "Monitos", "Tops", "Polleras"];
  List<DropdownMenuItem<String>> dropDownMenuItems;
  String prendaActual;

  void initState() {
    dropDownMenuItems = getDropDownMenuItems();
    prendaActual = dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String prenda in prendas) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(value: prenda, child: new Text(prenda)));
    }
    return items;
  }

  void changedDropDownItem(String selectedprenda) {
    //print("Selected city $selectedprenda, we are going to refresh the UI");
    setState(() {
      prendaActual = selectedprenda;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Color.fromRGBO(249, 154, 200, 20),
      items: dropDownMenuItems,
      style: widget.estilo_personalizado,
      onChanged: changedDropDownItem,
      value: prendaActual,
      iconSize: 30,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.white,
      ),
    );
  }
}
