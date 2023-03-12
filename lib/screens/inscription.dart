import 'package:flutter/material.dart';
import '/app_colors.dart';
import '/widgets/my_text_field.dart';
import '/widgets/my_text_button.dart';

class InscriptionPage extends StatefulWidget {
  final String title = "Inscription";

  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
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
                "Inscription",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              /*Padding(
                padding: const EdgeInsets.only(left: 65, right: 65),
                child:*/ Text(
                  "Veuillez saisir ces différentes informations, afin que vos listes soient sauvegardées.",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                //),
              ),
              const SizedBox(height: 30),
              const MyTextField(text: "Nom d'utilisateur", obscureText: false,),
              const SizedBox(height: 10),
              const MyTextField(text: "E-mail", obscureText: false,),
              const SizedBox(height: 10),
              const MyTextField(text: "Mot de passe", obscureText: true,),
              const SizedBox(height: 10),
              const MyTextField(text: "Vérification du mot de passe", obscureText: true,),
              const SizedBox(height: 70),
              const MyTextButton(type: false, text: "S'inscrire"),
            ]
        ),
      ),
    );
  }
}