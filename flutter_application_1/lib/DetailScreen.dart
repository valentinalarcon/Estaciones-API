import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/conection/coneccion.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailScreen extends StatelessWidget {
  final estacion;
  DetailScreen(@required this.estacion, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var longitud = double.parse(estacion['longitud']);
    var latitud = double.parse(estacion['latitud']);

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
      body: Stack(children: [
        TextField(),
        Column(
          children: [
            Container(
              height: 300.0,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition:
                    CameraPosition(target: LatLng(latitud, longitud), zoom: 9),
                markers: [
                  Marker(
                      markerId: MarkerId(estacion['nombre']),
                      position: LatLng(latitud, longitud),
                      draggable: true)
                ].toSet(),
              ),
            ),
            Container(
                child: FutureBuilder(
              future: getIdRequest(estacion['codigo']),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null)
                  return Text('🥺Información no disponible.');
                var temperaturamax = snapshot.data["tmax"];
                var temperaturamin = snapshot.data["tmin"];
                var precipitaciones = snapshot.data["precip"];
                var dia = snapshot.data["dia"];
                var mes = snapshot.data["mes"];
                var anio = snapshot.data["ano"];
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    _CrearCard1(temperaturamax, temperaturamin, precipitaciones,
                        dia, mes, anio),
                  ],
                );
              },
            )),
          ],
        ),
      ]),
    );
  }
}

Widget _CrearCard1(
    temperaturamax, temperaturamin, precipitaciones, dia, mes, anio) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 20,
    child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          DataTable(
            columns: [
              DataColumn(
                  label: Text(' Información ',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text(' ',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Fecha')),
                DataCell(Text('$dia/$mes/$anio')),
              ]),
              DataRow(cells: [
                DataCell(Text('Temperatura maxima')),
                DataCell(Text('$temperaturamax °')),
              ]),
              DataRow(cells: [
                DataCell(Text('Temperatura mínima')),
                DataCell(Text('$temperaturamin °')),
              ]),
              DataRow(cells: [
                DataCell(Text('Precipitaciones')),
                DataCell(Text('$precipitaciones mm')),
              ]),
            ],
          ), /* 
          Text(
            "Información de la estación",
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Temperatura maxima : $temperaturamax °",
              style: TextStyle(fontSize: 19.0),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Temperatura minima : $temperaturamin °",
              style: TextStyle(fontSize: 19.0),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Precipitaciones : $precipitaciones mm",
              style: TextStyle(fontSize: 19.0),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Fecha : $dia/$mes/$anio",
              style: TextStyle(fontSize: 19.0),
            ), 
          ),*/
        ],
      ),
    ),
  );
}

/* 
children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Temperatura maxima : $temperaturamax °",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Temperatura minima : $temperaturamin °",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Precipitaciones : $precipitaciones mm",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Fecha : $dia/$mes/$anio",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ] */