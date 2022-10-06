import 'package:medicinal_date/screens/add_medicine/add_medicine.dart';
import 'package:medicinal_date/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Agenda de remedios",
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/add": (context) => const addMedicine(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 34, 142, 54),
          secondary: Color.fromARGB(255, 34, 142, 54),
        ),
      ),
    ),
  );
  body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/foto background"), fit: BoxFit.cover,),
          ),
        ),
      ],
    );
}
