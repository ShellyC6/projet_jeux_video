import 'package:flutter/material.dart';
import '/app_colors.dart';
import '/widgets/search_bar.dart';
import '/widgets/apercu.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:10, bottom: 10, right: 10, top:90),
        child: Column(
            children: <Widget>[
              Text(
                "Accueil",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SearchBar(text: "Rechercher un jeu..."),
              const SizedBox(height: 50),
              Apercu(),
              const SizedBox(height: 10),
              Apercu(),
              const SizedBox(height: 10),
              Apercu(),
            ]
        ),
      ),
    );
  }

}