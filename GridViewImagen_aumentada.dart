import 'package:flutter/material.dart';

class ImagenGrande extends StatelessWidget {
  final String id;

  ImagenGrande(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Colors.blueGrey,
      // ignore: unnecessary_brace_in_string_interps
      body: Image.network("https://picsum.photos/id/${id}/600/600"),
    );
  }
}
