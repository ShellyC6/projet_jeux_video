import 'package:flutter/material.dart';
import '/AppColors.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bienvenue !",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text("Veuillez vous connecter ou créer un nouveau compte pour utiliser l'application"),
            const TextField(
              obscureText: true,

              decoration: InputDecoration(
                labelText: 'E-mail',
                filled: true,
                fillColor: AppColors.contrastColor,
              ),
            )
          ]
        ),
      ),
    );
  }
}