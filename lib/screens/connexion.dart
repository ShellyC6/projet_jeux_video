import 'package:flutter/material.dart';
import '/app_colors.dart';
import '/widgets/my_text_field.dart';

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
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
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
            const MyTextField(text: "E-mail"),
            const SizedBox(height: 10),
            const MyTextField(text: "Mot de passe"),
            const SizedBox(height: 70),
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        print("Bouton Se connecter");
                      },
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        foregroundColor: AppColors.textColor,
                      ),
                      child: const Center(
                          child: Text("Se connecter")
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: (){
                  print("Bouton Créer un nouveau compte");
                },
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  foregroundColor: AppColors.textColor,
                  side: const BorderSide(width: 2, color: AppColors.accentColor)
                ),
                child: const Text("Créer un nouveau compte"),
              ),
            ),
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