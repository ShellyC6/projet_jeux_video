import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_jeux_video/services/user/user_bloc.dart';
import 'app_theme.dart';
import 'screens/connexion.dart';
import 'screens/inscription.dart';
import 'screens/accueil.dart';
import 'screens/recherche.dart';
import 'screens/wishlist.dart';
import 'screens/likes.dart';
import 'screens/jeu.dart';
import 'package:firebase_core/firebase_core.dart';      // Pour se connecter à firebase
import 'package:cloud_firestore/cloud_firestore.dart';  // Pour utiliser firestore

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Pour s'assurer que tout est bien lancé avant de démarrer
  await Firebase.initializeApp();             // Pour connecter l'application Flutter à Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'Game Store',
        theme: AppThemeDataFactory.prepareThemeData(),
        home: ConnexionPage(),
      ),
    );
  }
}