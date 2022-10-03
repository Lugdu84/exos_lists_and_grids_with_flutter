import 'package:flutter/material.dart';
import 'model/place.dart';

class DetailView extends StatelessWidget {
  final Place place;
  const DetailView({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Image.asset(place.getFolderPath()),
        Text(place.desc)
      ])),
    );
  }
}
