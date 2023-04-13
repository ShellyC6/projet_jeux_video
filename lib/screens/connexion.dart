import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_jeux_video/screens/inscription.dart';
import '../services/user/user_bloc.dart';
import '/app_colors.dart';
import '/widgets/my_text_field.dart';
import '/widgets/my_text_button.dart';
import 'accueil.dart';

class ConnexionPage extends StatefulWidget {
  final String title = "Connexion";

  //User currentUser = User(name: "", email: "");

  ConnexionPage({super.key});

  final emailController = TextEditingController();
  final mdpController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    mdpController.dispose();
  }

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {

  Future<bool> connect() async {
    final db = FirebaseFirestore.instance;

    final querySnapshot = await db.collection("Users")
        .where("mail", isEqualTo: widget.emailController.text)
        .where("mdp", isEqualTo: widget.mdpController.text)
        .get();
    if(querySnapshot.docs.isEmpty){
      print("Erreur lors de la connexion");
      return false;
    }
    context.read<UserBloc>().add(UserConnectEvent(name: "nom random", email: widget.emailController.text));

    // Vider les textFields
    widget.emailController.clear();
    widget.mdpController.clear();

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.bgColor,
      child: Padding(
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
            MyTextField(text: "E-mail", obscureText: false, myController: widget.emailController,),
            const SizedBox(height: 10),
            MyTextField(text: "Mot de passe", obscureText: true, myController: widget.mdpController,),
            const SizedBox(height: 70),
            MyTextButton(type: false, text: "Se connecter", page: AccueilPage(), f: connect,),
            const SizedBox(height: 15),
            MyTextButton(type: true, text: "Créer un nouveau compte", page: InscriptionPage(),),
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