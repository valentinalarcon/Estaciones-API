import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/DetailScreen.dart';
import 'package:flutter_application_1/conection/coneccion.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EstacionesVista extends StatefulWidget {
  EstacionesVista({Key? key}) : super(key: key);

  @override
  _EstacionesVistaState createState() => _EstacionesVistaState();
}

class _EstacionesVistaState extends State<EstacionesVista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Row(
          children: [
            Text(
              'Estaciones',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
          child: FutureBuilder<List>(
        future: getRequest(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) return Text('Loading');
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var estaciones = snapshot.data;
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(estaciones[index])),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        estaciones[index]['nombre'],
                        style: TextStyle(fontSize: 22.0),
                      ),
                    ),
                  ));
            },
          );
        },
      )),
    );
  }
}
