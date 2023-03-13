import 'package:flutter/material.dart';
import '/app_colors.dart';
import '/widgets/my_text_field.dart';
import '/widgets/my_text_button.dart';

class ConnexionPage extends StatefulWidget {
  final String title = "Connexion";

  const ConnexionPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(left:30, bottom: 10, right: 30, top:90),
        child: Column(
          children: <Widget>[
            Text(
              "Bienvenue !",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 65, right: 65),
              child: Text(
                "Veuillez vous connecter ou créer un nouveau compte pour utiliser l'application",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            const MyTextField(text: "E-mail", obscureText: false,),
            const SizedBox(height: 10),
            const MyTextField(text: "Mot de passe", obscureText: true,),
            const SizedBox(height: 70),
            const MyTextButton(type: false, text: "Se connecter"),
            const SizedBox(height: 15),
            const MyTextButton(type: true, text: "Créer un nouveau compte"),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: (){
                    print("Bouton Mot de passe oublié");
                  },
                  style: TextButton.styleFrom(
                    //alignment: Alignment.bottomCenter,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    foregroundColor: AppColors.grey,

                  ),
                  child: const Text(
                    "Mot de passe oublié",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}