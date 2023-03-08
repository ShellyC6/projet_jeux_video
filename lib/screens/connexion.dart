import 'package:flutter/material.dart';
import '/app_theme.dart';

class ConnexionPage extends StatefulWidget {
  final String title = "Connexion";

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Bienvenue !",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text("Veuillez vous connecter"),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            )
          ]
        ),
      ),
    );
  }
}