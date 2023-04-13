import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_jeux_video/screens/accueil.dart';
import 'package:projet_jeux_video/services/user/user_bloc.dart';
import '/app_colors.dart';
import '/widgets/my_text_field.dart';
import '/widgets/my_text_button.dart';
import 'package:firebase_core/firebase_core.dart';      // Pour se connecter à firebase
import 'package:cloud_firestore/cloud_firestore.dart';  // Pour utiliser firestore
import '/user.dart';

class InscriptionPage extends StatefulWidget {
  final String title = "Inscription";
  //User currentUser = User(name: "nameOfTheGuy", email: "");

  InscriptionPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mdpController = TextEditingController();
  final mdp2Controller = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    mdpController.dispose();
    mdp2Controller.dispose();
  }

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {

  // Ajoute l'utilisateur
  Future<bool> add() async {
    final db = FirebaseFirestore.instance;
    // Vérifier si l'utilisateur existe déjà
    final querySnapshot = await db.collection("Users").where("mail", isEqualTo: widget.emailController.text).get();
    if(querySnapshot.docs.isEmpty){
      // Vérification des textField
      if(widget.nameController.text.isNotEmpty && widget.emailController.text.isNotEmpty && widget.mdpController.text.isNotEmpty && (widget.mdpController.text == widget.mdp2Controller.text)) {
        // Enregistrer les informations du nouvel utilisateur
        final data = {
          "nom": widget.nameController.text,
          "mail": widget.emailController.text,
          "mdp": widget.mdpController.text,
          "likes": [],
          "wishlist": [],
        };
        await db.collection("Users").add(data);
        // Connexion du nouvel utilisateur
        /*print("Suppressions de l'utilisateur ${widget.currentUser.name}");
        widget.currentUser = User(name: widget.nameController.text, email: widget.emailController.text);
        print("Inscription de l'utilisateur ${widget.currentUser.name}");*/
        context.read<UserBloc>().add(UserConnectEvent(name: widget.nameController.text, email: widget.emailController.text));

        // Vider les textFields
        widget.mdpController.clear();
        widget.emailController.clear();
        widget.nameController.clear();
        widget.mdp2Controller.clear();

        return true;
      }
    }
    print("Erreur lors de l'inscription");
    return false;
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
                "Inscription",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Veuillez saisir ces différentes informations, afin que vos listes soient sauvegardées.",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              MyTextField(text: "Nom d'utilisateur", obscureText: false, myController: widget.nameController,),
              const SizedBox(height: 10),
              MyTextField(text: "E-mail", obscureText: false, myController: widget.emailController,),
              const SizedBox(height: 10),
              MyTextField(text: "Mot de passe", obscureText: true, myController: widget.mdpController,),
              const SizedBox(height: 10),
              MyTextField(text: "Vérification du mot de passe", obscureText: true, myController: widget.mdp2Controller,),
              const SizedBox(height: 70),
              MyTextButton(type: false, text: "S'inscrire", page: AccueilPage(), f: add,),
            ]
        ),
      ),
    );
  }
}