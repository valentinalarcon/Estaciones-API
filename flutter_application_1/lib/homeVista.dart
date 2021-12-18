import 'package:flutter/material.dart';
import 'package:flutter_application_1/conection/coneccion.dart';
import 'package:flutter_application_1/estacionesVista.dart';
import 'package:flutter_application_1/IntegrantesVista.dart';
import 'package:flutter_application_1/loginVista.dart';
import 'package:google_sign_in/google_sign_in.dart';

class second extends StatefulWidget {
  String url;
  String name;
  String email;
  second({
    required this.url,
    required this.name,
    required this.email,
  });
  @override
  _secondState createState() => _secondState(
        url: url,
        name: name,
        email: email,
      );
}

class _secondState extends State<second> {
  String url;
  String name;
  String email;
  _secondState({
    required this.url,
    required this.name,
    required this.email,
  });
  GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Bienvenido'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {
              _googleSignIn.signOut().then((value) {
                setState(() {});
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (firstpage()),
                  ),
                );
              }).catchError((e) {});
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              _CrearCard1(context),
              _CrearCard2(context),
              _CrearCard3(context)
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Bienvenido'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              _CrearCard1(context),
              _CrearCard2(context),
              _CrearCard3(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _CrearCard1(context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    elevation: 8,
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EstacionesVista(),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.rss_feed,
              size: 25,
              color: Colors.blue.shade900,
            ),
            Text(
              'Estaciones',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Estaciones nos permite ver los datos almacenados de cada estación metereológica, además de información referente a ellas..',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ),
  );
}

Widget _CrearCard2(context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    elevation: 8,
    child: InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.water,
              size: 25,
              color: Colors.blue.shade900,
            ),
            Text(
              'Estimacion',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Estimación te permitirá mostrar información estimada referente a una dirección valida.',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ),
  );
}

Widget _CrearCard3(context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    elevation: 8,
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => IntegrantesVista(),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.group,
              size: 25,
              color: Colors.blue.shade900,
            ),
            Text(
              'Integrantes',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Accede a la información de los desarrolladores de este proyecto.',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ),
  );
}
