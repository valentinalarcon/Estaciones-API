import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'homeVista.dart';

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String url = "";
  String name = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          Image(
            image: AssetImage('assets/logosf.png'),
            height: 200,
            width: 300,
          ),
          Text(
            'Bienvenido de Vuelta',
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          Image(
            image: AssetImage('assets/login.png'),
            height: 250,
            width: 250,
          ),
          GoogleAuthButton(
            text: 'Iniciar Sesión ',
            style: AuthButtonStyle(
              width: 280.0,
              height: 50.0,
              elevation: 10.0,
            ),
            onPressed: () {
              _googleSignIn.signIn().then((userData) {
                setState(() {
                  _userObj = userData;
                  url = _userObj!.photoUrl.toString();
                  name = _userObj!.displayName.toString();
                  email = _userObj!.email;
                });
                if (userData != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (second(
                        url: url,
                        name: name,
                        email: email,
                      )),
                    ),
                  );
                }
              }).catchError((e) {
                print(e);
              });
            },
            darkMode: false, // if true second example
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            'App desarrollada por Alonso Pino y Valentina Tobar',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
