import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'screens/connexion.dart';
import 'screens/inscription.dart';
import 'screens/accueil.dart';
import 'screens/recherche.dart';
import 'screens/wishlist.dart';
import 'screens/likes.dart';
import 'screens/jeu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Store',
      theme: AppThemeDataFactory.prepareThemeData(),
      home: const ConnexionPage(),
    );
  }
}