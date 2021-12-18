import 'package:flutter/material.dart';

class IntegrantesVista extends StatefulWidget {
  IntegrantesVista({Key? key}) : super(key: key);

  @override
  _IntegrantesVistaState createState() => _IntegrantesVistaState();
}

class _IntegrantesVistaState extends State<IntegrantesVista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Integrantes'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              _CrearCard1(),
              _CrearCard2(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _CrearCard1() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    elevation: 8,
    child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/alonso.png'),
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Alonso Pino chung',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            child: Text('Universidad Tecnológica Metropolitana'),
          ),
          SizedBox(
            height: 3,
          ),
          Text('Correo : alonso.pinoc@utem.cl'),
          SizedBox(
            height: 3,
          ),
          Text('Github : alonsopinoo')
        ],
      ),
    ),
  );
}

Widget _CrearCard2() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    elevation: 8,
    child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/vale.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Valentina Tobar Alarcón',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            child: Text('Universidad Tecnológica Metropolitana'),
          ),
          SizedBox(
            height: 3,
          ),
          Text('Correo : Valentina.tobara@utem.cl'),
          SizedBox(
            height: 3,
          ),
          Text('Github : valentinalarcon')
        ],
      ),
    ),
  );
}
